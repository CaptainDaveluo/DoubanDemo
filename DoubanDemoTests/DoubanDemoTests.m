//
//  DoubanDemoTests.m
//  DoubanDemoTests
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking/AFNetworking.h>
#import "BookService.h"

@interface DoubanDemoTests : XCTestCase

@end

@implementation DoubanDemoTests
NSMutableArray *books;
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//- (void)testBookService{
//    BookService *service = [BookService new];
//    NSString *url = @"https://api.douban.com/v2/book/search";
//    NSString *key=@"python";
//    
//    [service getRequestWithURL:url withKey:key completion:^(NSMutableArray *data) {
//        books=data;
//        XCTAssertNotNil(books, @"book service get book not be nil");
//        XCTAssertGreaterThan([books count], 5,@"111");
//    }];
//}

@end
