#import "mpollutionitemhourly.h"

@implementation mpollutionitemhourly

-(instancetype)init:(mpollutionindex*)index hour:(NSNumber*)hour
{
    self = [super init];
    self.index = index;
    
    return self;
}

@end