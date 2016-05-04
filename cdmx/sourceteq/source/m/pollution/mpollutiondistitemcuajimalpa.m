#import "mpollutiondistitemcuajimalpa.h"

static NSString* const texturename = @"districts_cuajimalpa";

@implementation mpollutiondistitemcuajimalpa

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_cuajimalpa_name", nil) texturename:texturename];
    
    return self;
}

@end