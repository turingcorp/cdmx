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
    
    vradiationactivities *activities = [[vradiationactivities alloc] init];
    self.activities = activities;
    
    vradiationprecautions *precautions = [[vradiationprecautions alloc] init];
    self.precautions = precautions;
    
    [self addSubview:bar];
    [self addSubview:reactor];
    [self addSubview:activities];
    [self addSubview:precautions];
    
    NSDictionary *views = @{@"bar":bar, @"reactor":reactor, @"activities":activities, @"precautions":precautions};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[activities]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[precautions]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-50-[reactor]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[activities]-0-[precautions]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.reactor.timer invalidate];
}

#pragma mark public

-(void)radiationloaded:(mradiation*)model
{
    [self.reactor loadradiation:model];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.activities update:model];
                   });
}

@end