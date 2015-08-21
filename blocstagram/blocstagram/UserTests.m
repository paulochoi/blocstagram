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


- (void)testThatMediaInitializationWorks
{
    
    NSDictionary *picURL = @{@"url" : @"http://www.example.com/example.jpg"};

    NSDictionary *pic = @{@"standard_resolution" : picURL};
    
//    NSDictionary *sourceDictionary = @{@"id": @"8675309",
//                                       @"username" : @"d'oh",
//                                       @"full_name" : @"Homer Simpson",
//                                       @"profile_picture" : @"http://www.example.com/example.jpg"};
    
    
    NSDictionary *sourceDictionary = @{@"id" : @"8675309",
                                       @"user" : @"d'oh"};

    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.user, sourceDictionary[@"user"], @"The username should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL, sourceDictionary[@"images"][@"standard_resolution"][@"url"], @"The pic should be equal");
    XCTAssertEqualObjects(testMedia.caption, sourceDictionary[@"caption"], @"The profile picture should be equal");
}


@end
