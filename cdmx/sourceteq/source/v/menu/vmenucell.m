#import "vmenucell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vmenucell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:17]];
    [label setTextColor:[UIColor main]];
    self.label = label;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setUserInteractionEnabled:NO];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setClipsToBounds:YES];
    [icon setTintColor:[UIColor main]];
    self.icon = icon;
    
    [self addSubview:label];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"label":label, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[icon(40)]-2-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[icon]-14-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mmenusectionitem*)model
{
    [self.label setText:model.name];
    [self.icon setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

@end