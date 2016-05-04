#import "mpollutiondistitemxochimilco.h"

static NSString* const texturename = @"districts_xochimilco";

@implementation mpollutiondistitemxochimilco

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_xochimilco_name", nil) texturename:texturename];
    
    return self;
}

@end