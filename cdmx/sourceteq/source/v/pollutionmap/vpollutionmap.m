#import "vpollutionmap.h"
#import "cpollution.h"
#import "vpollutionmapcell.h"
#import "vpollutionmapdisplayannotation.h"
#import "ecollectioncell.h"
#import "eannotationview.h"
#import "analytics.h"

static CGFloat const pollutionmapspansize = 0.05;
static CGFloat const latitudezocalo = 19.432503;
static CGFloat const longitudezocalo = -99.133223;
static NSInteger const mapheaderheight = 60;
static NSInteger const mapcellheight = 52;
static NSInteger const mapcollectionbottom = 65;
static NSInteger const mapinteritemspace = -1;
static NSInteger const pollutionmapheight = 200;

@implementation vpollutionmap
{
    BOOL userupdated;
}

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    self.model = (mpollutionmap*)controller.model.option;
    self.mapspan = MKCoordinateSpanMake(pollutionmapspansize, pollutionmapspansize);
    userupdated = NO;
  
    vpollutionmapdisplay *display = [[vpollutionmapdisplay alloc] init];
    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(latitudezocalo, longitudezocalo), self.mapspan);
    [display setRegion:region animated:NO];
    [display setDelegate:self];
    self.display = display;
    
    vpollutionmapheader *header = [[vpollutionmapheader alloc] init];
    self.header = header;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:mapinteritemspace];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(pollutionmapheight + mapheaderheight + mapinteritemspace, 0, mapcollectionbottom, 0)];
    
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
    [collection setAlpha:0];
    self.collection = collection;
    
    [self addSubview:collection];
    [self addSubview:header];
    [self addSubview:display];
    
    NSDictionary *views = @{@"display":display, @"col":collection, @"header":header};
    NSDictionary *metrics = @{@"headerheight":@(mapheaderheight)};
    
    self.layoutdisplayheight = [NSLayoutConstraint constraintWithItem:display attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:pollutionmapheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]-0-[header(headerheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutdisplayheight];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.display setShowsUserLocation:NO];
}

#pragma mark private

-(mpollutionmapitem*)modelforindex:(NSIndexPath*)index
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
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1.5), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.display selectAnnotation:closeritem.annotation animated:YES];
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

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newdisplayheight = pollutionmapheight - offsety;
    
    if(newdisplayheight < pollutionmapheight)
    {
        newdisplayheight = pollutionmapheight;
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
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmapitem *model = [self modelforindex:index];
    vpollutionmapcell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionmapcell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmapitem *model = [self modelforindex:index];
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
    if(status != kCLAuthorizationStatusNotDetermined)
    {
        if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse)
        {
            [self.display setShowsUserLocation:YES];
        }
        else
        {
            [self.header deniedlocation];
        }
        
        [self.controller activelistener];
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

#pragma mark option

-(void)didappear
{
    [self locationscheck];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSArray<mpollutionmapitemannotation*> *annotations = [welf.model annotations];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.display addAnnotations:annotations];
                                          
                                          [UIView animateWithDuration:0.5 animations:
                                           ^
                                           {
                                               [welf.collection setAlpha:1];
                                           }];
                                      });
                   });
}

@end