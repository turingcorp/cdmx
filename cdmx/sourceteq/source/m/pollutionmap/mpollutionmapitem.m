#import "mpollutionmapitem.h"

@implementation mpollutionmapitem

#pragma mark public

-(mpollutionmapitemannotation*)asannotation
{
    mpollutionmapitemannotation *annotation = [[mpollutionmapitemannotation alloc] init:self.latitude lon:self.longitude];
    annotation.index = self.index;
    annotation.model = self;
    self.annotation = annotation;
    self.closer = NO;
    
    return annotation;
}

@end