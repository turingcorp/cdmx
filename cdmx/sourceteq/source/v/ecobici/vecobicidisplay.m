#import "vecobicidisplay.h"

@implementation vecobicidisplay

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setRotateEnabled:NO];
    [self setScrollEnabled:YES];
    [self setZoomEnabled:YES];
    [self setPitchEnabled:NO];
    [self setMapType:MKMapTypeStandard];
    [self setShowsBuildings:NO];
    [self setShowsPointsOfInterest:YES];
    
    if([self respondsToSelector:@selector(setShowsCompass:)])
    {
        [self setShowsCompass:NO];
    }
    
    if([self respondsToSelector:@selector(setShowsScale:)])
    {
        [self setShowsScale:NO];
    }
    
    if([self respondsToSelector:@selector(setShowsTraffic:)])
    {
        [self setShowsTraffic:NO];
    }
    
    return self;
}

@end