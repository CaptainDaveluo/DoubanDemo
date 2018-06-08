#import <Cedar/Cedar.h>
#import "FirstLoadView.h"
#import "ContentViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FirstLoadViewSpec)

describe(@"FirstLoadView", ^{
    __block FirstLoadView *view;
    __block ContentViewController *content;
    __block UIViewController *resultView;
    

    beforeEach(^{
        view = [[FirstLoadView alloc]init];
    });
    
    it(@"should view load normally", ^{
        view should_not be_nil;
    });
    
    
    describe(@"-viewControllerBeforeViewController", ^{
        context(@"when the index of controller is 1", ^{
            beforeEach(^{
                content = [view viewControllerAtIndex:1];
                resultView = [view pageViewController:view.pageViewController viewControllerBeforeViewController:content];
            });

            it(@"should result view be not nil",^{
                resultView should_not be_nil;
            });
        });

        context(@"when the index of controller is 0", ^{
            beforeEach(^{
                content = [view viewControllerAtIndex:0];
                resultView = [view pageViewController:view.pageViewController viewControllerBeforeViewController:content];
            });

            it(@"should result view be nil",^{
                resultView should be_nil;
            });
        });

    });
    
    describe(@"-viewControllerAfterViewController", ^{
        context(@"when the index of controller is count -1", ^{
            beforeEach(^{
                content = [view viewControllerAtIndex: [view.pageContentArray count]-1];
                resultView = [view pageViewController:view.pageViewController viewControllerAfterViewController:content];
            });
            
            it(@"should result view be nil",^{
                resultView should be_nil;
            });
        });
        
        context(@"when the index of controller is count", ^{
            beforeEach(^{
                content = [view viewControllerAtIndex: [view.pageContentArray count]];
                resultView = [view pageViewController:view.pageViewController viewControllerAfterViewController:content];
            });
            
            it(@"should result view be nil",^{
                resultView should be_nil;
            });
        });
        
        context(@"when the index of controller is 0", ^{
            beforeEach(^{
                content = [view viewControllerAtIndex:0];
                resultView = [view pageViewController:view.pageViewController viewControllerAfterViewController:content];
            });
            
            it(@"should result view be not nil",^{
                resultView should_not be_nil;
            });
        });
        
    });
});

SPEC_END
