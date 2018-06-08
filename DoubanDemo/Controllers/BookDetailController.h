//
//  BookDetailController.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/24.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BookInfo.h"
@interface BookDetailController:UIViewController{
}
@property(nonatomic,weak) BookInfo *book;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorIntro;
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *bookSummary;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisher;
@property (weak, nonatomic) IBOutlet UILabel *bookPrice;
@property (weak, nonatomic) IBOutlet UILabel *bookCatalog;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
-(IBAction)back:(UIButton *)sender;
@end
