#import "mpollutiondistitemvenustianocarranza.h"

static NSString* const texturename = @"districts_venustianocarranza";

@implementation mpollutiondistitemvenustianocarranza

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_venustianocarranza_name", nil) texturename:texturename];
    
    return self;
}

@end