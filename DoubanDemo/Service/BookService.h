//
//  BookService.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/5/23.
//  Copyright © 2018 dave.luo. All rights reserved.
//

typedef void(^CompleteImageBlock)(NSString *parameter);
@interface BookService:NSObject{
    
}
@property(nonatomic,weak) NSMutableArray *books;
@property(nonatomic,strong) CompleteImageBlock block;
-(void)getRequestWithURL:(NSString *)urlStr withKey:(NSString *)keyWord withTableView:(UITableView *)tableView withData:(NSMutableArray *)datas;
@end
