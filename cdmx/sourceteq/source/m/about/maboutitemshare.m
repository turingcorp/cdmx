#import "maboutitemshare.h"
#import "tools.h"

@implementation maboutitemshare

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"about_item_share", nil);
    
    return self;
}

#pragma mark -
#pragma mark about item

-(void)activate
{
    [tools shareapp];
}

@end