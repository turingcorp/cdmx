#import "mpollutiondistitembenitojuarez.h"

static NSString* const texturename = @"districts_benitojuarez";

@implementation mpollutiondistitembenitojuarez

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_benitojuarez_name", nil) texturename:texturename];
    
    return self;
}

@end