#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mstationsreadingitem.h"

@interface mstationsannotation:NSObject<MKAnnotation>

-(instancetype)init:(NSString*)newtitle model:(mstationsreadingitem*)model coord:(CLLocationCoordinate2D)coord;

@property(weak, nonatomic)mstationsreadingitem *model;

@end