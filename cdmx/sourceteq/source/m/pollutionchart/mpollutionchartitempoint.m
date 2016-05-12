#import "mpollutionchartitempoint.h"

@implementation mpollutionchartitempoint

-(instancetype)init:(mpollutionindex*)index name:(NSString*)name
{
    self = [super init];
    self.index = index;
    self.name = name;
    
    return self;
}

@end