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
@property(strong,nonatomic) NSMutableArray *books;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBook;
@property (weak, nonatomic) IBOutlet UITableView *bookList;
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

