#import "mpollutionitemdaily.h"
#import "tools.h"

@implementation mpollutionitemdaily

-(instancetype)init:(mpollutionindex*)index date:(NSNumber*)date
{
    self = [super init];
    self.index = index;
    self.makesstandby = NO;
    self.name = [[tools singleton] datefromserver:date];
    
    return self;
}

@end