#import "vradiation.h"
#import "vradiationbar.h"
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
    [label setFont:[UIFont boldsize:17]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor blackColor]];
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
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-(-40)-[reactor]-(-3)-[label(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[activities]-30-[precautions]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.reactor.timer invalidate];
}

#pragma mark actions

-(void)actionbuttonerror:(UIButton*)button
{
    [self displayloading];
    [self.controller loadradiation];
}

#pragma mark functionality

-(void)displayloading
{
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
    [self.reactor setHidden:NO];
    [self.label setHidden:NO];
    [self.activities setHidden:NO];
    [self.precautions setHidden:NO];
}

-(void)displayerror
{
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
    [self.reactor setHidden:YES];
    [self.label setHidden:YES];
    [self.activities setHidden:YES];
    [self.precautions setHidden:YES];
}

#pragma mark public

-(void)radiationloaded:(mradiation*)model
{
    self.model = model;
    [self.reactor loadradiation:model];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf displayloading];
                       [welf.label setText:model.name];
                       [welf.activities update:model];
                       [welf.precautions update:model];
                   });
}

-(void)error:(NSString*)error
{
    [self displayerror];
    
    UILabel *labelerror = [[UILabel alloc] init];
    [labelerror setBackgroundColor:[UIColor clearColor]];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setNumberOfLines:0];
    [labelerror setTextAlignment:NSTextAlignmentCenter];
    [labelerror setFont:[UIFont regularsize:16]];
    [labelerror setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelerror setText:error];
    self.labelerror = labelerror;
    
    UIButton *buttonerror = [[UIButton alloc] init];
    [buttonerror setBackgroundColor:[UIColor clearColor]];
    [buttonerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonerror setClipsToBounds:YES];
    [buttonerror setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonerror setTitleColor:[[UIColor colorWithWhite:0.8 alpha:1] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [buttonerror setTitle:NSLocalizedString(@"api_retry", nil) forState:UIControlStateNormal];
    [buttonerror.titleLabel setFont:[UIFont boldsize:16]];
    [buttonerror addTarget:self action:@selector(actionbuttonerror:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonerror = buttonerror;
    
    [self addSubview:labelerror];
    [self addSubview:buttonerror];
    
    NSDictionary *views = @{@"label":labelerror, @"button":buttonerror};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[button]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label(60)]-0-[button(40)]" options:0 metrics:metrics views:views]];
}

@end