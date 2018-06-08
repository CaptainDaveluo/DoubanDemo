//
//  BookService.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018 dave.luo. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

@interface BookService:NSObject{
    AFHTTPSessionManager *manager;
}
@property(nonatomic,strong) AFHTTPSessionManager *manager;
@property(nonatomic,weak) NSMutableArray *books;
-(void)getRequestWithURL:(NSString *)urlStr withKey:(NSString *)keyWord completion:(void (^)(NSMutableArray *data)) complete;
-(instancetype)initWithManager:(AFHTTPSessionManager *)apm;
@end
