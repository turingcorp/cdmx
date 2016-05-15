#import "vpollutionmap.h"
#import "cpollution.h"
#import "vpollutionmapcell.h"
#import "vpollutionmapdisplayannotation.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"
#import "eannotationview.h"

static CGFloat const pollutionmapspansize = 0.02;
static NSInteger const mapheaderheight = 150;
static NSInteger const mapcellheight = 50;
static NSInteger const mapcollectionbottom = 120;
static NSInteger const mapinteritemspace = -1;

@implementation vpollutionmap
{
    CGRect rect1;
    BOOL userupdated;
}

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    self.model = (mpollutionmap*)controller.model.option;
    self.mapspan = MKCoordinateSpanMake(pollutionmapspansize, pollutionmapspansize);
    rect1 = CGRectMake(0, 0, 1, 1);
  
    vpollutionmapdisplay *display = [[vpollutionmapdisplay alloc] init];
    [display setDelegate:self];
    self.display = display;
    userupdated = NO;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:mapinteritemspace];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, mapcollectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vpollutionmapcell class] forCellWithReuseIdentifier:[vpollutionmapcell reusableidentifier]];
    [collection registerClass:[vpollutionmapheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutionmapheader reusableidentifier]];
    self.collection = collection;
    
    [self addSubview:display];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"display":display, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.display setShowsUserLocation:NO];
}

#pragma mark functionality

-(mpollutionmapitem*)modeforindex:(NSIndexPath*)index
{
    mpollutionmapitem *model = self.model.items[index.item];
    
    return model;
}

-(void)centeruser
{
    MKCoordinateRegion region = MKCoordinateRegionMake(self.userlocation, self.mapspan);
    [self.display setRegion:region animated:YES];
}

-(void)findcloserstation
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       mpollutionmapitem *closeritem = [welf.model closertolat:welf.userlocation.latitude lon:welf.userlocation.longitude];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.header closerstationfound:closeritem];
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
                [self.display setShowsUserLocation:YES];
            }
            
            break;
            
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            
            [self.header deniedlocation];
            
            break;
    }
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, mapcellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, mapheaderheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vpollutionmapheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vpollutionmapheader reusableidentifier] forIndexPath:index];
    self.header = header;
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmapitem *model = [self modeforindex:index];
    vpollutionmapcell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionmapcell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmapitem *model = [self modeforindex:index];
    MKCoordinateRegion region = MKCoordinateRegionMake(model.annotation.coordinate, self.mapspan);
    [self.display setRegion:region animated:YES];
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
    /*
    if([view isKindOfClass:[vairgeomapann class]])
    {
        [self.controller selectitem:((vairgeomapann*)view).annotation.model];
        
        [[analytics singleton] trackevent:ga_event_environment_station action:ga_action_geo label:((vairgeomapann*)view).annotation.model.name];
    }*/
}

#pragma mark option

-(void)didappear
{
    [self locationscheck];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSArray<mpollutionmapitemannotation*> *annotations = [welf.model annotations];
                       [welf.display addAnnotations:annotations];
                   });
}

@end