#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "mpollutionindex.h"

@class mpollutionmapitem;

@interface mpollutionmapitemannotation:NSObject<MKAnnotation>

@property(weak, nonatomic)mpollutionmapitem *model;
@property(weak, nonatomic)mpollutionindex *index;

@end