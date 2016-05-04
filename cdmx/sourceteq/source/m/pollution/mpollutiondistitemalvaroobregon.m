#import "mpollutiondistitemalvaroobregon.h"

static NSString* const texturename = @"districts_alvaroobregon";

@implementation mpollutiondistitemalvaroobregon

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_alvaroobregon_name", nil) texturename:texturename];
    
    return self;
}

@end