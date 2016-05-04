#import "mpollutiondistitemazcapozalco.h"

static NSString* const texturename = @"districts_azcapozalco";

@implementation mpollutiondistitemazcapozalco

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_azcapozalco_name", nil) texturename:texturename];
    
    return self;
}

@end