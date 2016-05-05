#import "mpollutionreaditemglobal.h"

@implementation mpollutionreaditemglobal

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init:index];
    self.name = NSLocalizedString(@"mpollution_readitem_global", nil);
    
    return self;
}

@end