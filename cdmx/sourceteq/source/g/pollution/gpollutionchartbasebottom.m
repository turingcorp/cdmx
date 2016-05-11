#import "gpollutionchartbasebottom.h"
#import "ecolor.h"
#import "genericconstants.h"

@implementation gpollutionchartbasebottom

-(instancetype)init
{
    self = [super init:[UIColor main] toprigh:[UIColor main] bottomleft:[UIColor second] bottomright:[UIColor second]];
    self.x = 10;
    self.y = 100;
    self.width = 100;
    self.height = 50;
    
    [self render];
    [self movetotop];
    
    return self;
}

@end