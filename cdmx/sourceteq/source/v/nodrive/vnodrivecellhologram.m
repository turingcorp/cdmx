#import "vnodrivecellhologram.h"
#import "mnodrivetodayitemhologram.h"
#import "efont.h"
#import "ecolor.h"

@implementation vnodrivecellhologram

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIImageView *halo = [[UIImageView alloc] init];
    [halo setUserInteractionEnabled:NO];
    [halo setClipsToBounds:YES];
    [halo setContentMode:UIViewContentModeCenter];
    [halo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [halo setTintColor:[UIColor main]];
    [halo setImage:[[UIImage imageNamed:@"generic_halo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    UILabel *symbol = [[UILabel alloc] init];
    [symbol setTranslatesAutoresizingMaskIntoConstraints:NO];
    [symbol setTextColor:[UIColor blackColor]];
    [symbol setTextAlignment:NSTextAlignmentCenter];
    [symbol setUserInteractionEnabled:NO];
    [symbol setFont:[UIFont boldsize:14]];
    [symbol setBackgroundColor:[UIColor clearColor]];
    self.symbol = symbol;
    
    [self addSubview:halo];
    [self addSubview:symbol];
    
    NSDictionary *views = @{@"halo":halo, @"symbol":symbol};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[halo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[halo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[symbol]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[symbol]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark no drive cell

-(void)config:(mnodrivetodayitemhologram*)model
{
    [self.symbol setText:model.symbol];
}

@end