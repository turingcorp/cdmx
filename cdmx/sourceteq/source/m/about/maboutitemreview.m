#import "maboutitemreview.h"
#import "tools.h"

@implementation maboutitemreview

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"about_item_review", nil);
    
    return self;
}

#pragma mark -
#pragma mark about item

-(void)activate
{
    [tools rateapp];
}

@end