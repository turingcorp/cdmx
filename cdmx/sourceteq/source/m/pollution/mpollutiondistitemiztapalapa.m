#import "mpollutiondistitemiztapalapa.h"

static NSString* const texturename = @"districts_iztapalapa";

@implementation mpollutiondistitemiztapalapa

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_iztapalapa_name", nil) texturename:texturename];
    
    return self;
}

@end