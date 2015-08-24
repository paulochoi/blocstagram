//
//  UserTests.m
//  blocstagram
//
//  Created by Paulo Choi on 8/20/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "Media.h"
#import "ComposeCommentView.h"
#import "MediaTableViewCell.h"

@interface UserTests : XCTestCase

@end

@implementation UserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatInitializationWorks
{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"username" : @"d'oh",
                                       @"full_name" : @"Homer Simpson",
                                       @"profile_picture" : @"http://www.example.com/example.jpg"};
    User *testUser = [[User alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testUser.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testUser.userName, sourceDictionary[@"username"], @"The username should be equal");
    XCTAssertEqualObjects(testUser.fullName, sourceDictionary[@"full_name"], @"The full name should be equal");
    XCTAssertEqualObjects(testUser.profilePictureURL, [NSURL URLWithString:sourceDictionary[@"profile_picture"]], @"The profile picture should be equal");
}


-(void)testThatMediaInitializationWorks{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"user": @{@"id":@"8675309",
                                                  @"username" : @"d'oh",
                                                  @"full_name" : @"Homer Simpson",
                                                  @"profile_picture" : @"http://www.example.com/example.jpg"},
                                       @"images": @{@"standard_resolution" : @{@"url": @""}},
                                       @"caption": @{@"text": @"caption"},
                                       @"comments": @{},
                                       @"user_has_liked": @"true",
                                       @"likes" : @{@"count": @10}};
                                       
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.user.idNumber, sourceDictionary[@"user"][@"id"], @"The username should be equal");
    XCTAssertEqualObjects(testMedia.user.userName, sourceDictionary[@"user"][@"username"], @"The full name should be equal");
    XCTAssertEqualObjects(testMedia.user.fullName, sourceDictionary[@"user"][@"full_name"], @"The full name should be equal");
    XCTAssertEqualObjects(testMedia.user.profilePictureURL, [NSURL URLWithString:sourceDictionary[@"user"][@"profile_picture"]], @"The profile picture should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"The caption should be equal");
                                       
}

- (void)testThatIsWritingCommentWorks {
    ComposeCommentView *commentView = [ComposeCommentView new];
    
    [commentView setText:@"test"];
    
    XCTAssertEqual(commentView.isWritingComment, YES, @"Text is composing");
}

- (void)testThatIsWritingCommentWorksWithNoComment {
    ComposeCommentView *commentView = [ComposeCommentView new];
    
    XCTAssertEqual(commentView.isWritingComment, NO, @"Text is composing");
}

-(void)testMediaTableViewCellHeight {
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"user": @{@"id":@"8675309",
                                                  @"username" : @"d'oh",
                                                  @"full_name" : @"Homer Simpson",
                                                  @"profile_picture" : @"http://www.example.com/example.jpg"},
                                       @"images": @{@"standard_resolution" : @{@"url": @""}},
                                       @"caption": @{@"text": @"caption"},
                                       @"comments": @{},
                                       @"user_has_liked": @"true",
                                       @"likes" : @{@"count": @10}};
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    testMedia.image = [UIImage imageNamed:@"8.jpg"];
    CGFloat cellHeight = [MediaTableViewCell heightForMediaItem:testMedia width:[UIScreen mainScreen].bounds.size.width traitCollection:[UIScreen mainScreen].traitCollection];
    
    NSLog(@"%f", testMedia.image.size.height);
    NSLog(@"%f", cellHeight);
    
    XCTAssertNotEqual(cellHeight, testMedia.image.size.height, @"height is not equal because of comments");
    
}

@end
