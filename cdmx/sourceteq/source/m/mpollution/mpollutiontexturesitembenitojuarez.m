#import "mpollutiontexturesitembenitojuarez.h"

static NSString* const texturename = @"distritcs_bj";

@implementation mpollutiontexturesitembenitojuarez

-(instancetype)init
{
    self = [super init:NSLocalizedString(@"mpollution_texture_benitojuarez_name", nil) assetname:texturename];
    
    return self;
}

@end