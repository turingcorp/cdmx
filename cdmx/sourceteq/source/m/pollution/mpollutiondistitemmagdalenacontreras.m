#import "mpollutiondistitemmagdalenacontreras.h"

static NSString* const texturename = @"districts_magdalenacontreras";

@implementation mpollutiondistitemmagdalenacontreras

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_magdalenacontreras_name", nil) texturename:texturename];
    
    return self;
}

@end