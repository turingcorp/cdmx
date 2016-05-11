#import "gpollutionchartbasebottom.h"
#import "ecolor.h"
#import "genericconstants.h"

static NSInteger const chartbasebottomheight = 1;

@implementation gpollutionchartbasebottom

-(instancetype)init:(CGFloat)width
{
    self = [super init:[UIColor main] toprigh:[UIColor main] bottomleft:[UIColor main] bottomright:[UIColor main]];
    
    self.x = 0;
    self.y = pollution_drawableheight;
    self.width = width;
    self.height = chartbasebottomheight;
    
    [self render];
    [self movetotop];
    
    return self;
}

@end