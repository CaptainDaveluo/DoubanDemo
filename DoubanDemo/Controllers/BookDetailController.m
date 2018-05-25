//
//  BookDetailController.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/24.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "BookDetailController.h"
@implementation BookDetailController
@synthesize book;
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [_btnBack addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    _bookTitle.text=book.title;
    _bookSummary.text=book.summary;
    _bookSummary.numberOfLines=0;
    _bookPublisher.text=book.publisher;
    if([book.catalog isEqualToString:@""])
    {
        _bookCatalog.text=@"暂无章节概要";
        _bookCatalog.numberOfLines=1;
    }else{
        _bookCatalog.text=[NSString stringWithFormat:@"章节概要:\n%@",book.catalog];
        _bookCatalog.numberOfLines=0;
    }
    if([book.author_intro isEqualToString:@""])
    {
        _bookAuthorIntro.text=@"暂无作者简介";
        _bookAuthorIntro.numberOfLines=1;
    }else{
        _bookAuthorIntro.text=[NSString stringWithFormat:@"作者简介:%@",book.author_intro];
        _bookAuthorIntro.numberOfLines=0;
    }
    _bookPrice.text=book.price;
    _bookPrice.textColor=[UIColor redColor];
    
    [_bookImage sd_setImageWithURL:[NSURL URLWithString:book.image] placeholderImage:[UIImage imageNamed:@"placeholder" ]];
}

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
