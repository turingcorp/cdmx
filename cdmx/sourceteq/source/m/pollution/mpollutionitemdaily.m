#import "mpollutionitemdaily.h"
#import "tools.h"

@implementation mpollutionitemdaily

-(instancetype)init:(mpollutionindex*)index date:(NSNumber*)date
{
    self = [super init];
    self.index = index;
    self.name = NSLocalizedString(@"mpollution_item_daily_summary", nil);
    self.makesstandby = NO;
    
    return self;
}

@end