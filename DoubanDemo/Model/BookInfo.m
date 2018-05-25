//
//  BookInfo.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookInfo.h"

@implementation BookInfo
@synthesize bid;
@synthesize subtitle;
@synthesize author;
@synthesize pubdate;
@synthesize image;
@synthesize translator;
@synthesize catalog;
@synthesize pages;
@synthesize publisher;
@synthesize title;
@synthesize url;
@synthesize author_intro;
@synthesize summary;
@synthesize price;
-(id)initWithJson:(id)data{
    bid=data[@"id"];
    subtitle=data[@"subtitle"];
    author=data[@"author"];
    pubdate=data[@"pubdate"];
    image=data[@"image"];
    translator=data[@"translator"];
    catalog=data[@"catalog"];
    pages=data[@"pages"];
    publisher=data[@"publisher"];
    title=data[@"title"];
    url=data[@"url"];
    author_intro=data[@"author_intro"];
    summary=data[@"summary"];
    price=data[@"price"];
    return self;
}
@end
