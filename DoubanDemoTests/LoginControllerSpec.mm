#import <Cedar/Cedar.h>
#import "LoginController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(LoginControllerSpec)

describe(@"LoginController", ^{
    __block LoginController *loginController;

    beforeEach(^{
        loginController = [[LoginController alloc]init];
    });
    
    describe(@"when login view load", ^{
        it(@"should login view load successfully", ^{
            [loginController viewDidLoad];
            loginController should_not be_nil;
        });
    });
    
    describe(@"validate username", ^{
        __block NSString *userName;
        
        context(@"validate unaccetable account", ^{
            beforeEach(^{
                userName = @"asd8486";
            });
            it(@"should account 'asd8486' not be accetable", ^{
                [loginController validate:userName] should_not be_truthy;
            });
        });
        
        context(@"validate mobile account", ^{
            beforeEach(^{
                userName = @"18258458665";
            });
            it(@"should account '18258458665' be accetable", ^{
                [loginController validate:userName] should be_truthy;
            });
        });
        
        context(@"validate mobile account", ^{
            beforeEach(^{
                userName = @"1007909850@qq.com";
            });
            it(@"should account '1007909850@qq.com' be accetable", ^{
                [loginController validate:userName] should be_truthy;
            });
        });
    });
    
    
    describe(@"validate username,password empty or nil", ^{
        __block NSString *userName;
        __block NSString *userPass;
        
        context(@"when userName is nil or empty", ^{
            beforeEach(^{
                userName = @"123123423";
                userPass = @"";
            });
            
            it(@"should validate return true when input empty string", ^{
                [loginController checkEmptyUserName:userName andPwd:userPass]should_not be_truthy;
            });
        });
        
        context(@"when userPass is nil or empty", ^{
            beforeEach(^{
                userName = nil;
                userPass = @"123123423";
            });
            
            it(@"should validate return true when input empty string", ^{
                [loginController checkEmptyUserName:userName andPwd:userPass]should_not be_truthy;
            });
        });
        
        context(@"when userName and userPass is both not nil or empty", ^{
            beforeEach(^{
                userName = @"234234534";
                userPass = @"123123423";
            });
            
            it(@"should validate return true when input string", ^{
                [loginController checkEmptyUserName:userName andPwd:userPass]should be_truthy;
            });
        });
    });
    
    
    describe(@"when user login", ^{
        context(@"when login username is not accetable", ^{
            beforeEach(^{
                UITextField *tfUsername = [[UITextField alloc]init];
                UITextField *tfPassword= [[UITextField alloc]init];
                [loginController.view addSubview:tfUsername];
                [loginController.view addSubview:tfPassword];
                loginController.tfUserName = tfUsername;
                loginController.tfPassWord = tfPassword;
                loginController.tfUserName.text=@"";
                loginController.tfPassWord.text=@"";
            });
            
            it(@"should login successfully",^{
                [loginController shouldPerformSegueWithIdentifier:@"" sender:nil]should_not be_truthy;
            });
        });
        context(@"when login username is empty", ^{
            beforeEach(^{
                UITextField *tfUsername = [[UITextField alloc]init];
                UITextField *tfPassword= [[UITextField alloc]init];
                [loginController.view addSubview:tfUsername];
                [loginController.view addSubview:tfPassword];
                loginController.tfUserName = tfUsername;
                loginController.tfPassWord = tfPassword;
                loginController.tfUserName.text=@"123423";
                loginController.tfPassWord.text=@"123123";
            });
            
            it(@"should login successfully",^{
                [loginController shouldPerformSegueWithIdentifier:@"" sender:nil] should_not be_truthy;
            });
        });
        
        context(@"when login username is accatable", ^{
            beforeEach(^{
                UITextField *tfUsername = [[UITextField alloc]init];
                UITextField *tfPassword= [[UITextField alloc]init];
                [loginController.view addSubview:tfUsername];
                [loginController.view addSubview:tfPassword];
                loginController.tfUserName = tfUsername;
                loginController.tfPassWord = tfPassword;
                loginController.tfUserName.text=@"1007909850@qq.com";
                loginController.tfPassWord.text=@"123123";
            });
            
            it(@"should login successfully",^{
                [loginController shouldPerformSegueWithIdentifier:@"" sender:nil] should be_truthy;
            });
        });
    });
});

SPEC_END
