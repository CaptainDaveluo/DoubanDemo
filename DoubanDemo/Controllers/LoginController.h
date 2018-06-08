//
//  LoginController.h
//  DoubanDemo
//
//  Created by dave.luo on 2018/6/8.
//  Copyright © 2018年 dave.luo. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface LoginController:UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UITextField *tfUserName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassWord;
@property (weak, nonatomic) IBOutlet UIButton *saveInfo;
@property(nonatomic) BOOL didSaveInfo;
-(IBAction)didSaveInfo:(id)sender;
-(BOOL)validate:(NSString *)userName;
-(BOOL)checkEmptyUserName:(NSString *)userName andPwd:(NSString *)userPass;
@end
