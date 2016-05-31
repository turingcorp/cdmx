#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "mpollutionmapitemannotation.h"

@interface vecobicidisplayannotation:MKAnnotationView

-(void)config;

@property(weak, nonatomic)UIImageView *img;

@end