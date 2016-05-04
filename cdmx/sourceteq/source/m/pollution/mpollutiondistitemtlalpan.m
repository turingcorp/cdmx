#import "mpollutiondistitemtlalpan.h"

static NSString* const texturename = @"districts_tlalpan";

@implementation mpollutiondistitemtlalpan

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_tlalpan_name", nil) texturename:texturename];
    
    return self;
}

@end