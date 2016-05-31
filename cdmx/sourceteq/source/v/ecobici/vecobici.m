#import "vecobici.h"
#import "vecobicimenu.h"

static CGFloat const ecobicimapspansize = 0.015;
static CGFloat const latitudecondesa = 19.411619;
static CGFloat const longitudecondesa = -99.170436;
static NSInteger const ecobicimenuheight = 50;
static NSInteger const mapcellheight = 42;
static NSInteger const mapcollectionbottom = 40;
static NSInteger const mapinteritemspace = -1;
static NSInteger const ecobicimapheight = 200;

@implementation vecobici
{
    BOOL userupdated;
}

-(instancetype)init:(cecobici*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    self.mapspan = MKCoordinateSpanMake(ecobicimapspansize, ecobicimapspansize);
    userupdated = NO;
    
    vecobicidisplay *display = [[vecobicidisplay alloc] init];
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(latitudecondesa, longitudecondesa), self.mapspan);
    [display setRegion:region animated:NO];
    [display setDelegate:self];
    self.display = display;
    
    vecobicimenu *menu = [[vecobicimenu alloc] init:controller];
    
    [self addSubview:menu];
    [self addSubview:display];
    
    NSDictionary *views = @{@"menu":menu, @"display":display};
    NSDictionary *metrics = @{@"menuheight":@(ecobicimenuheight)};
    
    self.layoutdisplayheight = [NSLayoutConstraint constraintWithItem:display attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:ecobicimapheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutdisplayheight];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.display setShowsUserLocation:NO];
}

#pragma mark private

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.display setRegion:region animated:YES];
}

-(void)findcloserstation
{
    /*
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       mpollutionmapitem *closeritem = [welf.model closertolat:welf.userlocation.latitude lon:welf.userlocation.longitude];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1.5), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.display selectAnnotation:closeritem.annotation animated:YES];
                                      });
                   });*/
}

-(void)locationscheck
{
    switch([CLLocationManager authorizationStatus])
    {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            
            [self.display setShowsUserLocation:YES];
            
            break;
            
        case kCLAuthorizationStatusNotDetermined:
            
            [[NSNotificationCenter defaultCenter] removeObserver:self.controller];
            
            self.locationmanager = [[CLLocationManager alloc] init];
            [self.locationmanager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
            [self.locationmanager setDistanceFilter:10];
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
                [self.display setShowsUserLocation:YES];
            }
            
            break;
            
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            break;
    }
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newdisplayheight = ecobicimapheight - offsety;
    
    if(newdisplayheight < ecobicimapheight)
    {
        newdisplayheight = ecobicimapheight;
    }
    
    self.layoutdisplayheight.constant = newdisplayheight;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, mapcellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = 0;//self.controller.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    return nil;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
//    mpollutionmapitem *model = [self modeforindex:index];
//    MKCoordinateRegion region = MKCoordinateRegionMake(model.annotation.coordinate, self.mapspan);
//    [self.display setRegion:region animated:YES];
//    [self.display selectAnnotation:model.annotation animated:YES];
}

#pragma mark location delegate

-(void)mapView:(MKMapView*)mapview didUpdateUserLocation:(MKUserLocation*)userlocation
{
    self.userlocation = userlocation.coordinate;
    
    if(!userupdated)
    {
        userupdated = YES;
        [self centeruser];
        [self findcloserstation];
    }
}

-(void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.display setShowsUserLocation:YES];
    }
}

-(MKAnnotationView*)mapView:(MKMapView*)mapview viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView *anview;
    
    if(annotation == self.display.userLocation)
    {
        anview = [mapview viewForAnnotation:annotation];
    }
    else
    {
        anview = [mapview dequeueReusableAnnotationViewWithIdentifier:[vpollutionmapdisplayannotation reusableidentifier]];
        
        if(anview)
        {
            anview.annotation = annotation;
        }
        else
        {
            anview = [[vpollutionmapdisplayannotation alloc] initWithAnnotation:annotation reuseIdentifier:[vpollutionmapdisplayannotation reusableidentifier]];
        }
        
        [(vpollutionmapdisplayannotation*)anview config];
    }
    
    return anview;
}

-(void)mapView:(MKMapView*)mapView didSelectAnnotationView:(MKAnnotationView*)view
{
    if([view isKindOfClass:[vpollutionmapdisplayannotation class]])
    {
        mpollutionmapitemannotation *annotation = (mpollutionmapitemannotation*)view.annotation;
        NSInteger index = [self.model.items indexOfObject:annotation.model];
        [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredVertically];
        [self.header showlocation:annotation.model];
        [[analytics singleton] trackevent:self.controller action:@"map" label:annotation.model.name];
    }
}

@end