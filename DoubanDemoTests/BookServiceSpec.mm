#import <Cedar/Cedar.h>
#import <AFNetworking/AFNetworking.h>
#import "BookService.h"
#import "Cedar.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;




SPEC_BEGIN(BookServiceSpec)

describe(@"BookService", ^{
    __block BookService *bookService;
    __block AFHTTPSessionManager *manager;
    __block UITableView *tableView;
    __block NSMutableArray *data;
    __block NSString *key;
    __block NSString *url;

    beforeEach(^{
        tableView = [[UITableView alloc]init];
        
        data = [[NSMutableArray alloc]init];
    });
    
    
    
    describe(@"test bookService", ^{

        context(@"get book success", ^{
            beforeEach(^{
                manager = fake_for([AFHTTPSessionManager class]);
                manager stub_method(@selector(GET:parameters:progress:success:failure:)).and_do(^(NSInvocation *) {
                    NSLog(@"11111");
                });
                bookService = [[BookService alloc]initWithManager:manager];
                
                url = @"https://api.douban.com/v2/book/search";
                key=@"java";
                //bookService stub_method(@selector(getRequestWithURL:withKey:completion:));
                
            });
            it(@"should manager not be nil", ^{
                [bookService getRequestWithURL:url withKey:key completion:^(NSMutableArray *data) {
                    bookService should have_received("getRequestWithURL:withKey:completion");
                    manager should have_received("GET:parameters:progress:success:failure:");
                }];
            });
        });
    });
});

SPEC_END
