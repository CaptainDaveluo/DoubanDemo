//
//  BookService.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "BookService.h"
#import "BookInfo.h"



@implementation BookService
@synthesize books;
@synthesize manager;
//Get book searching result
-(instancetype)initWithManager:(AFHTTPSessionManager *)apm{
    if(self=[super init]){
        self.manager = apm;
    }
    return self;
}
-(void)getRequestWithURL:(NSString *)urlStr withKey:(NSString *)keyWord completion:(void (^)(NSMutableArray *data))complete{
    if(manager==nil)
        manager = [AFHTTPSessionManager manager];
    NSLog(@"%@",keyWord);
    NSMutableArray *datas = [NSMutableArray new];
    NSDictionary *dict=@{
                         @"q":keyWord,
                         @"count":@10
                         };
 
    [manager GET:urlStr parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        //NSMutableArray *books=[NSMutableArray new];
        NSArray *json= responseObject[@"books"];
        
        for(id book in json){
            BookInfo *b = [[BookInfo alloc]initWithJson:book];
            NSLog(@"%@",b.author[0]);
            [datas addObject:b];
        }
        complete(datas);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        NSLog(@"返回失败");
        NSLog(@"%@",error);
        complete(nil);
    }];
}

@end
