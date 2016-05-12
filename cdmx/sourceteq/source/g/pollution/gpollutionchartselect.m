#import "gpollutionchartselect.h"

@implementation gpollutionchartselect

-(instancetype)init
{
    self = [super init:@"pollution_chartselect" srgb:NO];
    self.x = 100;
    self.y = 100;
    self.width = 20;
    self.height = 20;
    self.color = GLKVector4Make(0.3, 0.5, 0.7, 1);
    [self render];
    [self movetotop];
    
    return self;
}

@end