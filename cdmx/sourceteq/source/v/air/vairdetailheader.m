#import "vairdetailheader.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "tools.h"

@implementation vairdetailheader

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor main]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"general_backbutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"general_backbutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont regularsize:20]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:controller.model.name];
    
    UIImageView *imagetemp = [[UIImageView alloc] init];
    [imagetemp setImage:[[UIImage imageNamed:@"stations_temp"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagetemp setTintColor:[UIColor whiteColor]];
    [imagetemp setUserInteractionEnabled:NO];
    [imagetemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagetemp setClipsToBounds:YES];
    [imagetemp setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *rosewind = [[UIImageView alloc] init];
    [rosewind setImage:[[UIImage imageNamed:@"stations_rosewind"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [rosewind setTintColor:[UIColor whiteColor]];
    [rosewind setUserInteractionEnabled:NO];
    [rosewind setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rosewind setClipsToBounds:YES];
    [rosewind setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImageView *rosewindpointer = [[UIImageView alloc] init];
    [rosewindpointer setImage:[[UIImage imageNamed:@"stations_rosewindpointer"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [rosewindpointer setTintColor:[UIColor whiteColor]];
    [rosewindpointer setUserInteractionEnabled:NO];
    [rosewindpointer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rosewindpointer setClipsToBounds:YES];
    [rosewindpointer setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *labelrose = [[UILabel alloc] init];
    [labelrose setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelrose setTextAlignment:NSTextAlignmentCenter];
    [labelrose setUserInteractionEnabled:NO];
    [labelrose setFont:[UIFont regularsize:13]];
    [labelrose setTextColor:[UIColor whiteColor]];
    [labelrose setBackgroundColor:[UIColor clearColor]];
    [labelrose setText:NSLocalizedString(@"air_detail_header_wind", nil)];
    
    UILabel *labeltemp = [[UILabel alloc] init];
    [labeltemp setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltemp setUserInteractionEnabled:NO];
    [labeltemp setFont:[UIFont regularsize:16]];
    [labeltemp setTextColor:[UIColor whiteColor]];
    [labeltemp setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:label];
    [self addSubview:imagetemp];
    [self addSubview:rosewind];
    [self addSubview:rosewindpointer];
    [self addSubview:labelrose];
    [self addSubview:labeltemp];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"label":label, @"imagetemp":imagetemp, @"rosewind":rosewind, @"rosewindpointer":rosewindpointer, @"buttonback":buttonback, @"labelrose":labelrose, @"labeltemp":labeltemp};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[label]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[imagetemp(22)]-4-[labeltemp]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imagetemp(22)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[rosewind]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[rosewindpointer]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[rosewind(80)]-60-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[rosewindpointer(80)]-60-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelrose]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labelrose]-46-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeltemp(22)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonback(45)]" options:0 metrics:metrics views:views]];
    
    if(controller.model.wind)
    {
        CGFloat rads = controller.model.wind.direction * M_PI / 180.0;
        [rosewindpointer setTransform:CGAffineTransformMakeRotation(rads)];
    }
    else
    {
        [rosewindpointer setHidden:YES];
        [rosewind setHidden:YES];
        [labelrose setHidden:YES];
    }
    
    if(controller.model.conditions)
    {
        NSString *strtemp = [NSString stringWithFormat:NSLocalizedString(@"air_detail_header_temp", nil), [[tools singleton] numbertostring:@(controller.model.conditions.temperature)]];
        [labeltemp setText:strtemp];
    }
    else
    {
        [labeltemp setHidden:YES];
        [imagetemp setHidden:YES];
    }
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end