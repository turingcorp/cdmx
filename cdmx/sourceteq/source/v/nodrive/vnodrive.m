#import "vnodrive.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"

@implementation vnodrive

-(instancetype)init:(cnodrive*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vnodrivebar *bar = [[vnodrivebar alloc] init:self.controller];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:navbarheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    [NSNotification observe:self stationsloaded:@selector(notifiedstationsloaded:)];
    
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
                       
                   });
}


@end