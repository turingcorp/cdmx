#import "vclimate.h"
#import "vclimatebar.h"
#import "efont.h"

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

#pragma mark actions

-(void)actionbuttonerror:(UIButton*)button
{
    [self displayloading];
    [self.controller loadclimate];
}

#pragma mark functionality

-(void)displayloaded
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.collection setHidden:NO];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

-(void)displayloading
{
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
    [self.collection setHidden:YES];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

-(void)displayerror
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.collection setHidden:YES];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

#pragma mark public

-(void)climateloaded
{
    [self displayloaded];
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