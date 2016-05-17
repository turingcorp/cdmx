#import "vpollutionrecommendation.h"
#import "cpollutionrecommendation.h"

@implementation vpollutionrecommendation

-(instancetype)init:(cpollutionrecommendation*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:controller.model.name];
    
    return self;
}

@end