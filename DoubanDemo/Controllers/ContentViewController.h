//
//  ContentViewController.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/6.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ContentViewController:UIViewController
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) UIButton *enter;
@property (nonatomic) BOOL hideButton;

-(IBAction)enterApp:(id)sender;
@end
