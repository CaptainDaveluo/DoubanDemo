#import <Cedar/Cedar.h>
#import "AppDelegate.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *delegate;

    beforeEach(^{
        delegate = [[AppDelegate alloc]init];
    });
    
    context(@"when app is finished loading", ^{
        beforeEach(^{
            [delegate application:nil didFinishLaunchingWithOptions:nil];
        });
        
        it(@"should display a view", ^{
            delegate.window.rootViewController should be_nil;
        });
    });
});

SPEC_END
