#import "vpollutionmapdisplay.h"
#import "ecolor.h"

static NSInteger const pollutionmapheight = 200;

@implementation vpollutionmapdisplay

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
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor main]];
    
    [self addSubview:border];
    
    NSDictionary *views = @{@"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, pollutionmapheight);
}

@end