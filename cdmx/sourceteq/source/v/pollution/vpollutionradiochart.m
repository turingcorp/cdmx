#import "vpollutionradiochart.h"
#import "ecolor.h"
#import "efont.h"

static NSInteger const radiochartwidth_2 = 80;
static NSInteger const radiochartlinewidth = 8;

@implementation vpollutionradiochart

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.basecolor = [UIColor background];
    self.higlightcolor = index.color;
    self.size_2 = radiochartwidth_2;
    self.linewidth = radiochartlinewidth;
    self.currentpoints = index.points;
    self.maxpoints = [mpollutionindex maxpoints];
    [self render];
    
    return self;
}

@end