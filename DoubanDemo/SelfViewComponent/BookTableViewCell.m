//
//  BookTableViewCell.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/24.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookTableViewCell.h"

@implementation BookTableViewCell
@synthesize lbPrice;
@synthesize bookTitle;
@synthesize subtitle;
@synthesize author;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        CGFloat height = self.frame.size.height;
        CGFloat width = self.frame.size.width;
        lbPrice = [[UILabel alloc]initWithFrame:CGRectMake(width-20, height+70, 100,20)];
        bookTitle = [[UILabel alloc]initWithFrame:CGRectMake(170, 5, 200,50)];
        subtitle = [[UILabel alloc]initWithFrame:CGRectMake(170, 45, 200,50)];
        author = [[UILabel alloc]initWithFrame:CGRectMake(width-130, height+70, 100,20)];
        [lbPrice setTextColor:[UIColor redColor]];
        
        bookTitle.numberOfLines=0;
        bookTitle.font = [UIFont systemFontOfSize:19];
        subtitle.font = [UIFont systemFontOfSize:16];
        subtitle.numberOfLines=0;
        
        
        
        [self addSubview:bookTitle];
        [self addSubview:lbPrice];
        [self addSubview:subtitle];
        [self addSubview:author];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.bounds =CGRectMake(5,5,44,44);
    self.imageView.frame =CGRectMake(15,10,115,155);
}
@end
