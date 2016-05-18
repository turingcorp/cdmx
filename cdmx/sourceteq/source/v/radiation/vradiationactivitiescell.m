#import "vradiationactivitiescell.h"
#import "ecolor.h"

@implementation vradiationactivitiescell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];

    UIImageView *indicator = [[UIImageView alloc] init];
    [indicator setUserInteractionEnabled:NO];
    [indicator setClipsToBounds:YES];
    [indicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    [indicator setContentMode:UIViewContentModeScaleAspectFit];
    self.indicator = indicator;
    
    [self addSubview:indicator];
    
    NSDictionary *views = @{@"indicator":indicator};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[indicator(20)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[indicator(20)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mradiationactivity*)model
{
    UIColor *colorindicator;
    NSString *assetindicator;
    
    if(model.allowed)
    {
        colorindicator = [UIColor main];
        assetindicator = @"radiation_allowed";
    }
    else
    {
        colorindicator = [UIColor pollution_red];
        assetindicator = @"radiation_notallowed";
    }
    
    [self.indicator setTintColor:colorindicator];
    [self.indicator setImage:[[UIImage imageNamed:assetindicator] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

@end