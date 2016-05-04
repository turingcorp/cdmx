#import "mpollutiondistitemmilpaalta.h"

static NSString* const texturename = @"districts_milpaalta";

@implementation mpollutiondistitemmilpaalta

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_milpaalta_name", nil) texturename:texturename];
    
    return self;
}

@end