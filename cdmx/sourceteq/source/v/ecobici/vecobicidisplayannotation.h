#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "mecobiciitemannotation.h"

@interface vecobicidisplayannotation:MKAnnotationView

-(void)hover;

@property(weak, nonatomic)UIImageView *img;

@end