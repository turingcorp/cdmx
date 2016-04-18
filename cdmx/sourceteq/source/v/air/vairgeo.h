#import <UIKit/UIKit.h>
#import "cairgeo.h"
#import "vairgeomap.h"
#import "vairgeobar.h"

@interface vairgeo:UIView<MKMapViewDelegate, CLLocationManagerDelegate>

-(instancetype)init:(cairgeo*)controller;
-(void)loadmap;
-(void)centeruser;

@property(weak, nonatomic)cairgeo *controller;
@property(weak, nonatomic)vairgeobar *bar;
@property(weak, nonatomic)vairgeomap *map;
@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(nonatomic)MKCoordinateSpan mapspan;
@property(nonatomic)CLLocationCoordinate2D userlocation;

@end