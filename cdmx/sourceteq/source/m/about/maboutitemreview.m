#import "maboutitemreview.h"
#import "tools.h"
#import "analytics.h"

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
    [[analytics singleton] trackevent:ga_event_about_app action:ga_action_review label:nil];
}

@end