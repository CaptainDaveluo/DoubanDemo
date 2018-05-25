//
//  BookInfo.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
@interface BookInfo:NSObject{
    NSString *bid;
    NSString *subtitle;
    NSArray *author;
    NSString *pubdate;
    NSString *image;
    NSString *translator;
    NSString *catalog;
    NSString *pages;
    NSString *publisher;
    NSString *title;
    NSString *url;
    NSString *author_intro;
    NSString *summary;
    NSString *price;
}
@property(nonatomic,copy) NSString *bid;
@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,copy) NSArray *author;
@property(nonatomic,copy) NSString *pubdate;
@property(nonatomic,copy) NSString *image;
@property(nonatomic,copy) NSString *translator;
@property(nonatomic,copy) NSString *catalog;
@property(nonatomic,copy) NSString *pages;
@property(nonatomic,copy) NSString *publisher;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *author_intro;
@property(nonatomic,copy) NSString *summary;
@property(nonatomic,copy) NSString *price;
-(id)initWithJson:(id)data;
@end
