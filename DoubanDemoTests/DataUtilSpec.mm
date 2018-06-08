#import <Cedar/Cedar.h>
#import "DataUtil.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(DataUtilSpec)

describe(@"DataUtil", ^{

    beforeEach(^{

    });
    
    describe(@"set not first load data", ^{
        beforeEach(^{
            [DataUtil setNotFirstLoad];
        });
        
        it(@"should is first load be not true",^{
            BOOL isFirstLoad = [DataUtil isFirstLoad];
            isFirstLoad should_not be_truthy;
        });
    });
});

SPEC_END
