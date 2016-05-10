#import "mpollutionitemglobal.h"

@implementation mpollutionitemglobal

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.index = index;
    self.name = NSLocalizedString(@"mpollution_item_daily_summary", nil);
    self.makesstandby = NO;
    
    return self;
}

@end