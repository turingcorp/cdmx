#import "maboutitemshare.h"
#import "tools.h"
#import "analytics.h"

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
    [[analytics singleton] trackevent:ga_event_about_app action:ga_action_share label:nil];
}

@end