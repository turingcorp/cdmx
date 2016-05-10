#import "mpollutionitemdaily.h"

@implementation mpollutionitemdaily

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.index = index;
    self.name = NSLocalizedString(@"mpollution_item_daily_summary", nil);
    
    return self;
}

@end