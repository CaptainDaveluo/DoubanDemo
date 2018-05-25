//
//  ViewController.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookInfo.h"
#import "BookService.h"

@interface ViewController : UIViewController{
    NSString *url;
    BookService *bookService;
}
- (IBAction)btnBack:(id)sender;
@property(strong,nonatomic) NSMutableArray *books;

@end

