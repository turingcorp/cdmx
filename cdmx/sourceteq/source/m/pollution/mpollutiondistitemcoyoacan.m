#import "mpollutiondistitemcoyoacan.h"

static NSString* const texturename = @"districts_coyoacan";

@implementation mpollutiondistitemcoyoacan

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_coyoacan_name", nil) texturename:texturename];
    
    return self;
}

@end