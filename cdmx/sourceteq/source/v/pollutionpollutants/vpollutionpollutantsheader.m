#import "vpollutionpollutantsheader.h"
#import "ecolor.h"
#import "efont.h"

@implementation vpollutionpollutantsheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont boldsize:17]];
    [label setTextColor:[UIColor main]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UILabel *symbol = [[UILabel alloc] init];
    [symbol setUserInteractionEnabled:NO];
    [symbol setTranslatesAutoresizingMaskIntoConstraints:NO];
    [symbol setBackgroundColor:[UIColor clearColor]];
    [symbol setFont:[UIFont boldsize:16]];
    [symbol setTextColor:[UIColor whiteColor]];
    [symbol setTextAlignment:NSTextAlignmentCenter];
    self.symbol = symbol;
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setImage:[[UIImage imageNamed:@"generic_circle"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeCenter];
    [circle setTintColor:[UIColor second]];
    
    [circle addSubview:symbol];
    [self addSubview:label];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"circle":circle, @"label":label, @"symbol":symbol};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[circle]-0-[label(20)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[symbol]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[symbol]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionpollutant*)model
{
    [self.label setText:model.name];
    [self.symbol setText:model.symbol];
}

@end