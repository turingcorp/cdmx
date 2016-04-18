#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mstationsreadingitemindex.h"

@interface mstationsannotation:NSObject<MKAnnotation>

-(instancetype)init:(NSString*)newtitle index:(mstationsreadingitemindex*)index coord:(CLLocationCoordinate2D)coord;

@property(weak, nonatomic)mstationsreadingitemindex *index;

@end