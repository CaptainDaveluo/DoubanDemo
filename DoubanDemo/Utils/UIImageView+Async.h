//
//  UIImageView.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/24.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface UIImageView (Async)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder ;

@end
