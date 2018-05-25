//
//  BookTableViewCell.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/24.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
@interface BookTableViewCell:UITableViewCell{
    UILabel *lbPrice ;
    UILabel *bookTitle ;
    UILabel *author;
    UILabel *subtitle;
}
@property(nonatomic,strong) UILabel *lbPrice;
@property(nonatomic,strong) UILabel *bookTitle;
@property(nonatomic,strong) UILabel *author;
@property(nonatomic,strong) UILabel *subtitle;
@end
