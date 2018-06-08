#import <Cedar/Cedar.h>
#import "ViewController.h"
#import "BookService.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *viewController;
    __block NSMutableArray *books;
    __block NSIndexPath *indexPath;


    beforeEach(^{
        viewController = [[ViewController alloc]init];
        books = [NSMutableArray new];
    });


    describe(@"-numberOfSectionsInTableView:", ^{
        it(@"should return 1", ^{
            viewController.view should_not be_nil;
            [viewController numberOfSectionsInTableView:viewController.bookList] should equal(1);
        });
    });

    describe(@"-tableView:numberOfRowsInSection:", ^{
        it(@"should return the number of rows for the table view", ^{
            viewController.view should_not be_nil;

            viewController.books = books;

            [viewController tableView:viewController.bookList numberOfRowsInSection:0] should equal(0);
        });
    });

    describe(@"-tableView:heightForRowAtIndexPath:",^{
        beforeEach(^{
            indexPath = [NSIndexPath new];
        });

        it(@"should the heightForRowAtIndexPath return 160",^{
            [viewController tableView:viewController.bookList heightForRowAtIndexPath:indexPath] should equal(160);
        });
    });

    describe(@"-tableView:cellForRowAtIndexPath:",^{
        beforeEach(^{
            indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        });

        it(@"should cellForRowAtIndexPath not nil",^{
            [viewController tableView:viewController.bookList cellForRowAtIndexPath:indexPath] should_not be_nil;
        });
    });

    describe(@"-searchBarSearchButtonClicked:",^{


        it(@"should searchBar avaliable",^{
            [viewController searchBarSearchButtonClicked:viewController.searchBook];
        });
    });

    describe(@"-didSelectRowAtIndexPath:",^{
        beforeEach(^{
            indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        });

        it(@"should select row avaliable",^{
            [viewController tableView:viewController.bookList didSelectRowAtIndexPath:indexPath];
        });
    });
});

SPEC_END
