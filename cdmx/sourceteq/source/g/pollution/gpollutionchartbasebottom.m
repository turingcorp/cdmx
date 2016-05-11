#import "gpollutionchartbasebottom.h"
#import "ecolor.h"
#import "genericconstants.h"

static NSInteger const chartbasebottommarginx = 5;
static NSInteger const chartbasebottomheight = 2;

@implementation gpollutionchartbasebottom

-(instancetype)init
{
    self = [super init:[UIColor main] toprigh:[UIColor main] bottomleft:[UIColor main] bottomright:[UIColor main]];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat width = size.width;
    
    self.x = chartbasebottommarginx;
    self.y = pollution_drawableheight;
    self.width = width - (chartbasebottommarginx + chartbasebottommarginx);
    self.height = chartbasebottomheight;
    
    [self render];
    [self movetotop];
    
    return self;
}

@end