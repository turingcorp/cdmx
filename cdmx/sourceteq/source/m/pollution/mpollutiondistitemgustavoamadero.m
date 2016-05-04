#import "mpollutiondistitemgustavoamadero.h"

static NSString* const texturename = @"districts_gustavoamadero";

@implementation mpollutiondistitemgustavoamadero

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_gustavoamadero_name", nil) texturename:texturename];
    
    return self;
}

@end