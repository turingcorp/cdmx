#import "mpollutionmapitem.h"

@implementation mpollutionmapitem

#pragma mark public

-(mpollutionmapitemannotation*)asannotation
{
    mpollutionmapitemannotation *annotation = [[mpollutionmapitemannotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    annotation.index = self.index;
    annotation.model = self;
    self.annotation = annotation;
    
    return annotation;
}

@end