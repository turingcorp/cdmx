#import "vradiation.h"
#import "vradiationbar.h"

@implementation vradiation

-(instancetype)init:(cradiation*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vradiationbar *bar = [[vradiationbar alloc] init:controller];

    vradiationreactor *reactor = [[vradiationreactor alloc] init];
    self.reactor = reactor;
    
    [self addSubview:bar];
    [self addSubview:reactor];
    
    NSDictionary *views = @{@"bar":bar, @"reactor":reactor};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-50-[reactor]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.reactor.timer invalidate];
}

@end