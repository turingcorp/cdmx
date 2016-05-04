#import "mpollutiondistitemiztacalco.h"

static NSString* const texturename = @"districts_iztacalco";

@implementation mpollutiondistitemiztacalco

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_iztacalco_name", nil) texturename:texturename];
    
    return self;
}

@end