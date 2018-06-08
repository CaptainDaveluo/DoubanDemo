#import <Cedar/Cedar.h>
#import "ContentViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ContentViewControllerSpec)

describe(@"ContentViewController", ^{
    __block ContentViewController *contentView;

    beforeEach(^{
        contentView = [[ContentViewController alloc]init];
        contentView.hideButton=NO;
        [contentView viewDidLoad];
    });
    
    it(@"should content view load succesfully", ^{
        contentView should_not be_nil;
        
    });
    
    describe(@"-enterApp", ^{
        it(@"should contentView enterApp successfully", ^{
            [contentView enterApp:contentView.enter];
        });
    });
    
    
});

SPEC_END
