#import "mpollutiondistitembenitojuarez.h"

static NSString* const texturename = @"distritcs_bj";

@implementation mpollutiondistitembenitojuarez

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_district_benitojuarez_name", nil)];
    self.texturename = texturename;
    
    return self;
}

@end