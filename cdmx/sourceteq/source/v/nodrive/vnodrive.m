#import "vnodrive.h"
#import "genericconstants.h"
#import "nsnotification+nsnotificationmain.h"
#import "vnodriveholograms.h"
#import "vnodriveplates.h"
#import "mstations.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

static NSInteger const hologramsheight = 80;

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
    [labelerror setBackgroundColor:[UIColor clearColor]];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelerror setNumberOfLines:0];
    [labelerror setFont:[UIFont regularsize:16]];
    [labelerror setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelerror setTextAlignment:NSTextAlignmentCenter];
    self.labelerror = labelerror;
    
    UIButton *buttontry = [[UIButton alloc] init];
    [buttontry setClipsToBounds:YES];
    [buttontry setBackgroundColor:[UIColor second]];
    [buttontry setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttontry.titleLabel setFont:[UIFont boldsize:15]];
    [buttontry setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttontry setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttontry setTitle:NSLocalizedString(@"cars_nodrive_button_retry", nil) forState:UIControlStateNormal];
    [buttontry addTarget:self action:@selector(actionretry:) forControlEvents:UIControlEventTouchUpInside];
    self.buttontry = buttontry;
    
    [self addSubview:bar];
    [self addSubview:labelerror];
    [self addSubview:buttontry];
    
    NSDictionary *views = @{@"bar":bar, @"buttontry":buttontry, @"labelerror":labelerror};
    NSDictionary *metrics = @{};

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-100-[labelerror(50)]-10-[buttontry(34)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[buttontry]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelerror]-20-|" options:0 metrics:metrics views:views]];
    
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

#pragma mark actions

-(void)actionretry:(UIButton*)button
{
    [button setHidden:YES];
    [[mstations singleton] fetch];
}

#pragma mark functionality

-(void)tryload
{
    if([mstations singleton].error || ![mstations singleton].nodrive)
    {
        [self.buttontry setHidden:NO];
        
        NSString *stringerror = [mstations singleton].error;
        
        if(stringerror)
        {
            [self.labelerror setText:stringerror];
        }
    }
    else
    {
        [self.labelerror setHidden:YES];
        [self.buttontry setHidden:YES];
        
        [self showcollections];
    }
}

-(void)showcollections
{
    mstationsnodrive *nodrive = [mstations singleton].nodrive;
    vnodriveholograms *colholograms = [[vnodriveholograms alloc] init:nodrive];
    
    [self addSubview:colholograms];
    
    NSDictionary *views = @{@"bar":self.bar, @"holo":colholograms};
    NSDictionary *metrics = @{@"holoheight":@(hologramsheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[holo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-20-[holo(holoheight)]" options:0 metrics:metrics views:views]];
}

@end