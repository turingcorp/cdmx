#import "vnodrivecellplate.h"
#import "mnodrivetodayitemplate.h"
#import "efont.h"

@implementation vnodrivecellplate

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeCenter];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setImage:[[UIImage imageNamed:@"generic_circle"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.circle = circle;
    
    UILabel *number = [[UILabel alloc] init];
    [number setTranslatesAutoresizingMaskIntoConstraints:NO];
    [number setTextColor:[UIColor blackColor]];
    [number setTextAlignment:NSTextAlignmentCenter];
    [number setUserInteractionEnabled:NO];
    [number setFont:[UIFont regularsize:22]];
    [number setBackgroundColor:[UIColor clearColor]];
    self.number = number;
    
    [self addSubview:circle];
    [self addSubview:number];
    
    NSDictionary *views = @{@"circle":circle, @"number":number};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[number]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[number]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark no drive cell

-(void)config:(mnodrivetodayitemplate*)model
{
    [self.circle setTintColor:model.color];
    [self.number setText:model.number];
}

@end