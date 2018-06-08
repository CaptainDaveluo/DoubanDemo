//
//  LoginController.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/8.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginController.h"

@implementation LoginController
@synthesize tfPassWord;
@synthesize tfUserName;

- (void)viewDidLoad{
    [super viewDidLoad];
}


-(BOOL)validate:(NSString *)userName{
    NSString *regexMobile = @"^((1[3-8][0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *regexEmail = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexMobile];
    NSPredicate *predEmail  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexEmail];
    BOOL isMatchMobile = [predMobile evaluateWithObject:userName];
    BOOL isMatchEmail  = [predEmail evaluateWithObject:userName];
    if(isMatchMobile||isMatchEmail)
        return YES;
    else
        return NO;
}

-(BOOL)checkEmptyUserName:(NSString *)userName andPwd:(NSString *)userPass{
    BOOL isUserEmpty = NO;
    BOOL isPassEmpty = NO;
    if(userName==nil || [userName isEqualToString:@""])
        isUserEmpty=YES;
    if(userPass==nil || [userPass isEqualToString:@""])
        isPassEmpty=YES;
    return !(isUserEmpty || isPassEmpty);
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    NSString *userName = [tfUserName text];
    NSString *passWord = [tfPassWord text];
    UIAlertController *alertView;
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    if(![self checkEmptyUserName:userName andPwd:passWord]){
        alertView = [UIAlertController alertControllerWithTitle:@"用户登录" message:@"用户和密码不能为空"preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:actionOK];
        [self presentViewController:alertView animated:YES completion:nil];
        return NO;
    }else if(![self validate:userName]){
        alertView = [UIAlertController alertControllerWithTitle:@"用户登录" message:@"请输入格式正确的用户名" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:actionOK];
        [self presentViewController:alertView animated:YES completion:nil];
        return NO;
    }
    return YES;
};
@end
