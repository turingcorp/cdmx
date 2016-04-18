#import "vairgeo.h"
#import "vairgeobar.h"
#import "mstations.h"

static CGFloat const mapspansize = 0.1;

@implementation vairgeo
{
    BOOL userfound;
}

-(instancetype)init:(cairgeo*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    userfound = NO;
    self.mapspan = MKCoordinateSpanMake(mapspansize, mapspansize);
    vairgeobar *bar = [[vairgeobar alloc] init:controller];
    
    vairgeomap *map = [[vairgeomap alloc] init];
    self.map = map;
    
    [self addSubview:bar];
    [self addSubview:map];
    
    NSDictionary *views = @{@"bar":bar, @"map":map};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[map]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.map setShowsUserLocation:NO];
}

#pragma mark functionality

-(void)locationscheck
{
    switch([CLLocationManager authorizationStatus])
    {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            
            [self.map setShowsUserLocation:YES];
//            [self.menu showuserbutton];
            
            break;
            
        case kCLAuthorizationStatusNotDetermined:
            
            self.locationmanager = [[CLLocationManager alloc] init];
            [self.locationmanager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
            [self.locationmanager setDistanceFilter:30];
            [self.locationmanager setDelegate:self];
            
            if([self.locationmanager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            {
                [self.locationmanager requestWhenInUseAuthorization];
            }
            else
            {
                [self.locationmanager startUpdatingLocation];
            }
            
            if(![UIVisualEffectView class])
            {
//                [self.menu showuserbutton];
                [self.map setShowsUserLocation:YES];
            }
            
            break;
            
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusRestricted:
            break;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [self centeritems];
                   });
}

-(void)centeritems
{
    if([mstations singleton].readings.count)
    {
        NSArray<mstationsreadingitem*> *items = [[mstations singleton].readings lastObject].items;
        BOOL first = YES;
        
        for(mstationsreadingitem *item in items)
        {
            mstationsannotation *annotation;
            
            if(item.location)
            {
                NSString *title = item.name;
                mstationsreadingitemindex *index = item.index;
                CLLocationCoordinate2D coord = [item.location coordinates];
                
                annotation = [[mstationsannotation alloc] init:title index:index coord:coord];
            }
            else if(item.station.location)
            {
                NSString *title = item.name;
                mstationsreadingitemindex *index = item.index;
                CLLocationCoordinate2D coord = [item.station.location coordinates];
                
                annotation = [[mstationsannotation alloc] init:title index:index coord:coord];
            }
            
            if(annotation)
            {
                [self.map addAnnotation:annotation];
                
                if(first)
                {
                    first = NO;
                    
                    if(!userfound)
                    {
                        MKCoordinateRegion region = MKCoordinateRegionMake(annotation.coordinate, self.mapspan);
                        [self.map setRegion:region animated:YES];
                    }
                }
            }
        }
    }
}

#pragma mark public

-(void)loadmap
{
    [self.map setDelegate:self];
    [self locationscheck];
}

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.map setRegion:region animated:YES];
}

#pragma mark -
#pragma mark location delegate

-(void)mapView:(MKMapView*)mapview didUpdateUserLocation:(MKUserLocation*)userlocation
{
    self.userlocation = userlocation.coordinate;
    
    if(!userfound)
    {
        userfound = YES;
        [self centeruser];
    }
}

-(void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
//        [self.menu showbuttonuser];
        [self.map setShowsUserLocation:YES];
    }
}

-(MKAnnotationView*)mapView:(MKMapView*)mapview viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *anview;
    
    if(annotation == self.map.userLocation)
    {
        anview = [mapview viewForAnnotation:annotation];
    }
    else
    {
        anview = [[vairgeomapann alloc] init:annotation];
    }
    
    return anview;
}

@end