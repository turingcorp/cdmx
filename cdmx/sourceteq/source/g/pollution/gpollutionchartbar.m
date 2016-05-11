#import "gpollutionchartbar.h"
#import "genericconstants.h"

@implementation gpollutionchartbar

-(instancetype)init:(mpollutionindex*)index x:(CGFloat)x width:(CGFloat)width
{
    self = [super init:[index.color colorWithAlphaComponent:1] toprigh:[index.color colorWithAlphaComponent:1] bottomleft:[index.color colorWithAlphaComponent:0.8] bottomright:[index.color colorWithAlphaComponent:0.8]];
    
    self.x = x;
    self.y = pollution_drawableheight - index.points;
    self.width = width;
    self.height = index.points;
    
    [self render];
    [self movetotop];
    
    return self;
}

@end