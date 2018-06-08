//
//  DataUtil.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/6.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataUtil.h"

@implementation DataUtil
+(void)setNotFirstLoad{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"NO" forKey:@"isFirstLoad"];
    [userDefaults synchronize];
}

+(BOOL)isFirstLoad{
    NSUserDefaults *userDafaults = [NSUserDefaults standardUserDefaults];
    NSString *firstLoad = [userDafaults objectForKey:@"isFirstLoad"];
    if(firstLoad != nil && [firstLoad isEqualToString:@"NO"])
        return NO;
    else
        return YES;
}
@end
