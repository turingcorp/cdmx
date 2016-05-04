#import "mpollutiondistitemtlahuac.h"

static NSString* const texturename = @"districts_tlahuac";

@implementation mpollutiondistitemtlahuac

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_tlahuac_name", nil) texturename:texturename];
    
    return self;
}

@end