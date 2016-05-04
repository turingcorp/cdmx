#import "vpollutionradiochart.h"
#import "ecolor.h"

static NSInteger const radiochartwidth_2 = 80;
static NSInteger const radiochartlinewidth = 10;

@implementation vpollutionradiochart

-(instancetype)init
{
    self = [super init];
    self.basecolor = [UIColor background];
    radiochart.higlightcolor = [UIColor pollution_red];
    radiochart.size_2 = radiocharwidth_2;
    radiochart.linewidth = radiochartlinewidth;
    radiochart.currentpoints = 150;
    radiochart.maxpoints = 200;
    [radiochart render];
    self.radiochart = radiochart;
    [self render];
    
    return self;
}

@end