//
//  FirstLoadView.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/5.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ContentViewController.h"
@interface FirstLoadView:UIViewController<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
{

}
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSArray *pageContentArray;
- (NSUInteger)indexOfViewController:(ContentViewController *)viewController;
- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index;
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController;
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController;
@end
