//
//  ContentViewController.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/6.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentViewController.h"
#import "LoginController.h"
#import "DataUtil.h"

#define kRandomColor ([UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0f])

@interface ContentViewController ()

@property (nonatomic, strong) UILabel *contentLabel;


@end

@implementation ContentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = kRandomColor;
    int width = self.view.frame.size.width;
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 100)];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.numberOfLines = 0;
    _contentLabel.backgroundColor = kRandomColor;
    _enter = [[UIButton alloc]initWithFrame:CGRectMake(width/2-50, 600, 100, 60)];
    _enter.backgroundColor=kRandomColor;
    [_enter setTitle:@"点击进入" forState:UIControlStateNormal];
    if(self.hideButton==YES)
        self.enter.hidden=YES;
    else{
        [self.enter addTarget:nil action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:_contentLabel];
    [self.view addSubview:_enter];
}

- (void) viewWillAppear:(BOOL)paramAnimated{
    [super viewWillAppear:paramAnimated];
    _contentLabel.text = _content;
}





-(IBAction)enterApp:(id)sender{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginController *loginView = [storyBoard instantiateViewControllerWithIdentifier:@"loginView"];
    [DataUtil setNotFirstLoad];
    [self presentViewController:loginView animated:YES completion:nil];
}
@end
