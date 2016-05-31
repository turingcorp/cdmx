#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "mecobiciitem.h"

@interface mecobiciitemannotation:NSObject<MKAnnotation>

-(instancetype)init:(CGFloat)lat lon:(CGFloat)lon;

@property(weak, nonatomic)mecobiciitem *model;

@end