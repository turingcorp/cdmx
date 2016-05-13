#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "vpollutionoption.h"
#import "vpollutionmapdisplay.h"
#import "mpollutionmap.h"
#import "vpollutionmapheader.h"

@interface vpollutionmap:vpollutionoption<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate, MKMapViewDelegate>

@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(weak, nonatomic)mpollutionmap *model;
@property(weak, nonatomic)vpollutionmapdisplay *display;
@property(weak, nonatomic)vpollutionmapheader *header;
@property(weak, nonatomic)UICollectionView *collection;
@property(assign, nonatomic)CLLocationCoordinate2D userlocation;
@property(assign, nonatomic)MKCoordinateSpan mapspan;

@end