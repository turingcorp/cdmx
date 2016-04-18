#import "vairgeo.h"
#import "vairgeobar.h"

static CGFloat const mapsansize = 0.025;

@implementation vairgeo

-(instancetype)init:(cairgeo*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairgeobar *bar = [[vairgeobar alloc] init:controller];
    
    vairgeomap *map = [[vairgeomap alloc] init];
    self.map = map;
    
    [self addSubview:bar];
    [self addSubview:map];
    
    NSDictionary *views = @{@"bar":bar, @"map":map};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[map]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.locationmanager stopUpdatingLocation];
    [self.map setShowsUserLocation:NO];
}


@end