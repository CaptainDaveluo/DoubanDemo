//
//  ViewController.m
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "BookTableViewCell.h"
#import "BookService.h"
#import "BookDetailController.h"
#import "ViewController.h"
#import "BookInfo.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBook;
@property (weak, nonatomic) IBOutlet UITableView *bookList;

@end

@implementation ViewController
@synthesize books;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _searchBook.barTintColor=[UIColor colorWithRed:67/255.0 green:189/255.0 blue:86/255.0 alpha:1];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    url = @"https://api.douban.com/v2/book/search";
    books = [[NSMutableArray alloc]init];
    _searchBook.delegate=self;
    _bookList.delegate=self;
    _bookList.dataSource=self;
    bookService = [[BookService alloc]init];
    [bookService getRequestWithURL:url withKey:@"python" withTableView:_bookList withData:books];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *key = searchBar.text;
    if(![key isEqualToString:@""])
        [bookService getRequestWithURL:url withKey:key withTableView:_bookList withData:books];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.books count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell==nil){
        cell = [[BookTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    BookInfo *book = [books objectAtIndex:indexPath.row];
    //cell.textLabel.text= book.title;
    cell.subtitle.text = book.summary;
    cell.lbPrice.text = book.price;
    cell.bookTitle.text=book.title;
    cell.author.text =book.author[0];
    NSString *imgUrl = book.image;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"placeholder" ]];
    //[cell.imageView setFrame:CGRectMake(0, 0, 40, 100)];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//
//    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BookDetailController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    detail.book=[books objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}

- (IBAction)btnBack:(id)sender {
}
@end
