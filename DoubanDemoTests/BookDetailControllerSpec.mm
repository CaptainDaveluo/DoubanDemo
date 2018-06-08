#import <Cedar/Cedar.h>
#import "BookDetailController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(BookDetailControllerSpec)

describe(@"BookDetailController", ^{
    __block BookDetailController *bookDetail;
    __block BookInfo             *book;

    beforeEach(^{
        bookDetail = [[BookDetailController alloc]init];
    });
    
    
    context(@"when book catalog is nil", ^{
        describe(@"when book detail controller loaded", ^{
            beforeEach(^{
                book = [BookInfo new];
                book.catalog=@"";
                bookDetail.book=book;
            });
            
            it(@"should book detail be not nil", ^{
                bookDetail.view should_not be_nil;
            });
        });
    });
    
    context(@"when book author intro is nil", ^{
        describe(@"when book detail controller loaded", ^{
            beforeEach(^{
                book = [BookInfo new];
                book.author_intro=@"";
                bookDetail.book=book;
            });
            
            it(@"should book detail be not nil", ^{
                bookDetail.view should_not be_nil;
            });
        });
    });
    
    describe(@"when back btn is clicked", ^{
        
        it(@"Pending click", ^{
            [bookDetail back:bookDetail.btnBack];
        });
    });
    
    
});

SPEC_END
