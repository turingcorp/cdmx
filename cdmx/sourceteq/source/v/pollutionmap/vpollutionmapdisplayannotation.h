#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "mpollutionmapitemannotation.h"

@interface vpollutionmapdisplayannotation:MKAnnotationView

-(void)config;

@property(weak, nonatomic)UIImageView *img;
@property(weak, nonatomic)UILabel *label;

@end