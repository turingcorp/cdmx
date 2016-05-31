#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "cecobici.h"
#import "vecobicidisplay.h"

@interface vecobici:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate, MKMapViewDelegate>

-(instancetype)init:(cecobici*)controller;

@property(strong, nonatomic)CLLocationManager *locationmanager;
@property(weak, nonatomic)cecobici *controller;
@property(weak, nonatomic)vecobicidisplay *display;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutdisplayheight;
@property(assign, nonatomic)CLLocationCoordinate2D userlocation;
@property(assign, nonatomic)MKCoordinateSpan mapspan;

@end