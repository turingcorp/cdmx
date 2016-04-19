#import "vnodrive.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"
#import "vnodriveholograms.h"
#import "vnodriveplates.h"
#import "mstations.h"

@implementation vnodrive

-(instancetype)init:(cnodrive*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vnodrivebar *bar = [[vnodrivebar alloc] init:self.controller];
    self.bar = bar;

    UILabel *labelerror = [[UILabel alloc] init];
    self.labelerror = labelerror;
    
    UIButton *buttontry = [[UIButton alloc] init];
    self.buttontry = buttontry;
    
    [self addSubview:bar];
    [self addSubview:buttontry];
    
    NSDictionary *views = @{@"bar":bar, @"buttontry":buttontry, @"labelerror":labelerror};
    NSDictionary *metrics = @{};

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-10-[labelerror]-10-[buttontry(34)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[buttontry]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[labelerror]-50-|" options:0 metrics:metrics views:views]];
    
    [NSNotification observe:self stationsloaded:@selector(notifiedstationsloaded:)];
    
    [self tryload];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedstationsloaded:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self tryload];
                   });
}

#pragma mark functionality

-(void)tryload
{
    if([mstations singleton].nodrive)
    {
        [self.labelerror setHidden:YES];
        [self.buttontry setHidden:YES];
    }
    else
    {
        
    }
}

@end