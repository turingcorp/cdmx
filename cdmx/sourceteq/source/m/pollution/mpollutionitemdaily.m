#import "mpollutionitemdaily.h"
#import "tools.h"
#import "gpollutionchartbar.h"

@implementation mpollutionitemdaily

-(instancetype)init:(mpollutionindex*)index date:(NSNumber*)date spatialx:(CGFloat)spatialx spatialwidth:(CGFloat)spatialwidth
{
    self = [super init];
    self.index = index;
    self.makesstandby = NO;
    self.name = [[tools singleton] datefromserver:date];
    self.spatial = [[gpollutionchartbar alloc] init:index x:spatialx width:spatialwidth];
    
    return self;
}

@end