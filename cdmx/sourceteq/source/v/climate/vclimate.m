#import "vclimate.h"
#import "vclimatebar.h"

@interface vclimate ()

@property(weak, nonatomic, readwrite)cclimate *controller;

@end

@implementation vclimate

-(instancetype)init:(cclimate*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vclimatebar *bar = [[vclimatebar alloc] init:controller];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end