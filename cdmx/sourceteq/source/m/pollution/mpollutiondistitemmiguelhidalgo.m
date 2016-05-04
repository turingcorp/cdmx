#import "mpollutiondistitemmiguelhidalgo.h"

static NSString* const texturename = @"districts_miguelhidalgo";

@implementation mpollutiondistitemmiguelhidalgo

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_miguelhidalgo_name", nil) texturename:texturename];
    
    return self;
}

@end