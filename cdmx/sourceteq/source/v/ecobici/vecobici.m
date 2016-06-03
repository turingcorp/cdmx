#import "vecobici.h"
#import "vecobicicell.h"
#import "vecobicidisplayannotation.h"
#import "eannotationview.h"
#import "ecollectioncell.h"
#import "analytics.h"

static CGFloat const ecobicimapspansize = 0.0025;
static CGFloat const latitudecondesa = 19.411619;
static CGFloat const longitudecondesa = -99.170436;
static NSInteger const ecobicimenuheight = 50;
static NSInteger const mapcellheight = 46;
static NSInteger const mapcollectionbottom = 80;
static NSInteger const mapinteritemspace = -1;
static NSInteger const ecobicimapheight = 200;
static NSInteger const ecobicimapmargin = 120;

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
    
    vecobicimenu *menu = [[vecobicimenu alloc] init:controller];
    self.menu = menu;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:mapinteritemspace];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(ecobicimapheight - ecobicimapmargin, 0, mapcollectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vecobicicell class] forCellWithReuseIdentifier:[vecobicicell reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:collection];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"menu":menu, @"col":collection};
    NSDictionary *metrics = @{@"menuheight":@(ecobicimenuheight), @"mapmargin":@(ecobicimapmargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(mapmargin)-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.display setShowsUserLocation:NO];
}

#pragma mark private

-(void)loaddisplay
{
    vecobicidisplay *display = [[vecobicidisplay alloc] init];
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(latitudecondesa, longitudecondesa), self.mapspan);
    [display setRegion:region animated:NO];
    [display setDelegate:self];
    self.display = display;
    
    [self addSubview:display];
    
    NSDictionary *views = @{@"display":display};
    NSDictionary *metrics = @{};
    
    self.layoutdisplayheight = [NSLayoutConstraint constraintWithItem:display attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:ecobicimapheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutdisplayheight];
}

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.display setRegion:region animated:YES];
}

-(void)centercloser
{
    [self.display selectAnnotation:self.closeritem.annotation animated:YES];
}

-(void)findcloserstation
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       welf.closeritem = [welf.controller.model closertolat:welf.userlocation.latitude lon:welf.userlocation.longitude];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf centercloser];
                                          [welf.menu updateuser];
                                      });
                   });
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

-(mecobiciitem*)modelforindex:(NSIndexPath*)index
{
    mecobiciitem *model = self.controller.model.items[index.item];
    
    return model;
}

#pragma mark public

-(void)viewdidappear
{
    [self loaddisplay];
    [self locationscheck];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSArray<mecobiciitemannotation*> *annotations = [welf.controller.model annotations];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.display addAnnotations:annotations];
                                          [welf.collection reloadData];
                                      });
                   });
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
    NSInteger count = self.controller.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mecobiciitem *model = [self modelforindex:index];
    vecobicicell *cell = [col dequeueReusableCellWithReuseIdentifier:[vecobicicell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mecobiciitem *model = [self modelforindex:index];
    MKCoordinateRegion region = MKCoordinateRegionMake(model.annotation.coordinate, self.mapspan);
    [self.display setRegion:region animated:YES];
    [self.display selectAnnotation:model.annotation animated:YES];
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
        anview = [mapview dequeueReusableAnnotationViewWithIdentifier:[vecobicidisplayannotation reusableidentifier]];
        
        if(anview)
        {
            anview.annotation = annotation;
        }
        else
        {
            anview = [[vecobicidisplayannotation alloc] initWithAnnotation:annotation reuseIdentifier:[vecobicidisplayannotation reusableidentifier]];
        }
        
        [(vecobicidisplayannotation*)anview hover];
    }
    
    return anview;
}

-(void)mapView:(MKMapView*)mapView didSelectAnnotationView:(MKAnnotationView*)view
{
    if([view isKindOfClass:[vecobicidisplayannotation class]])
    {
        mecobiciitemannotation *annotation = (mecobiciitemannotation*)view.annotation;
        NSInteger index = [self.controller.model.items indexOfObject:annotation.model];
        [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredVertically];
        [[analytics singleton] trackevent:self.controller action:@"station" label:annotation.model.name];
    }
}

@end