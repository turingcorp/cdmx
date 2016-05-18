#import "vradiation.h"
#import "vradiationbar.h"
#import "ecolor.h"
#import "efont.h"

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
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:16]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor main]];
    self.label = label;
    
    [self addSubview:bar];
    [self addSubview:reactor];
    [self addSubview:activities];
    [self addSubview:precautions];
    [self addSubview:label];
    
    NSDictionary *views = @{@"bar":bar, @"reactor":reactor, @"activities":activities, @"precautions":precautions, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[activities]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[precautions]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-(-30)-[reactor]-0-[label(18)]" options:0 metrics:metrics views:views]];
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
                       [welf.label setText:model.name];
                       [welf.activities update:model];
                   });
}

@end