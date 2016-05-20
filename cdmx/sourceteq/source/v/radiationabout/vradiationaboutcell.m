#import "vradiationaboutcell.h"
#import "efont.h"

@implementation vradiationaboutcell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeCenter];
    [circle setUserInteractionEnabled:NO];
    [circle setImage:[[UIImage imageNamed:@"generic_halo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.circle = circle;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont numericsize:16]];
    [label setTextColor:[UIColor blackColor]];
    self.label = label;
    
    [self addSubview:circle];
    [self addSubview:label];

    NSDictionary *views = @{@"circle":circle, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[circle]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mradiationaboutitem*)model
{
    [self.circle setTintColor:model.index.color];
    [self.label setText:model.index.description];
}

@end