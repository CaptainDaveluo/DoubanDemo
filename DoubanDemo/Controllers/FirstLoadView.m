//
//  FirstLoadView.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/5.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FirstLoadView.h"

@interface FirstLoadView () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@end

@implementation FirstLoadView
-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    NSDictionary *options = @{UIPageViewControllerOptionInterPageSpacingKey : @(0)};
    _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
    options:options];
 
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;

    ContentViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [_pageViewController setViewControllers:viewControllers
                                  direction:UIPageViewControllerNavigationDirectionReverse
                                   animated:NO
                                 completion:nil];
    
    // 设置UIPageViewController 尺寸
    _pageViewController.view.frame = self.view.bounds;
    
    // 在页面上，显示UIPageViewController对象的View
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
}
-(NSArray *)pageContentArray{
    if(!_pageContentArray){
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        for (int i = 1; i < 5; i++) {
            NSString *contentString = [[NSString alloc] initWithFormat:@"Page %d", i];
            [arrayM addObject:contentString];
        }
        _pageContentArray = [[NSArray alloc] initWithArray:arrayM];
    }
    return _pageContentArray;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(ContentViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
    
    
}

#pragma mark 返回下一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(ContentViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageContentArray count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
    
    
}

#pragma mark - 根据index得到对应的UIViewController

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageContentArray count] == 0) || (index >= [self.pageContentArray count])) {
        return nil;
    }
    ContentViewController *contentVC = [[ContentViewController alloc] init];
    contentVC.content = [self.pageContentArray objectAtIndex:index];
    if(index==([self.pageContentArray count]-1)){
        contentVC.hideButton=NO;
    }else{
        contentVC.hideButton=YES;
    }
    return contentVC;
}

#pragma mark - 数组元素值，得到下标值

- (NSUInteger)indexOfViewController:(ContentViewController *)viewController {
    return [self.pageContentArray indexOfObject:viewController.content];
}
@end
