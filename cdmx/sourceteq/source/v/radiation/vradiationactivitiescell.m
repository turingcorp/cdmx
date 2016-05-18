#import "vradiationactivitiescell.h"
#import "ecolor.h"
#import "efont.h"

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
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setUserInteractionEnabled:NO];
    [image setClipsToBounds:YES];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTintColor:[UIColor main]];
    self.image = image;
    
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont regularsize:11]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    self.title = title;
    
    [self addSubview:title];
    [self addSubview:indicator];
    [self addSubview:image];
    
    NSDictionary *views = @{@"indicator":indicator, @"image":image, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[indicator(20)]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[indicator(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[image]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[image]-12-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(20)]-0-|" options:0 metrics:metrics views:views]];
    
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
        colorindicator = [UIColor second];
        assetindicator = @"radiation_notallowed";
    }
    
    [self.indicator setTintColor:colorindicator];
    [self.indicator setImage:[[UIImage imageNamed:assetindicator] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.image setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.title setText:model.name];
}

@end