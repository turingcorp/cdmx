#import "vnodrivecellrestriction.h"
#import "mnodrivetodayitemrestriction.h"
#import "ecolor.h"
#import "efont.h"

@implementation vnodrivecellrestriction

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor background]];
    [border setClipsToBounds:YES];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:[UIColor main]];
    self.icon = icon;
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextColor:[UIColor main]];
    [title setFont:[UIFont boldsize:13]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    self.title = title;
    
    UILabel *info = [[UILabel alloc] init];
    [info setBackgroundColor:[UIColor clearColor]];
    [info setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [info setFont:[UIFont regularsize:15]];
    [info setTranslatesAutoresizingMaskIntoConstraints:NO];
    [info setUserInteractionEnabled:NO];
    self.info = info;
    
    [self addSubview:border];
    [self addSubview:icon];
    [self addSubview:title];
    [self addSubview:info];
    
    NSDictionary *views = @{@"border":border, @"icon":icon, @"title":title, @"info":info};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[border]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[icon(30)]-10-[title]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-10-[info]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(15)]-0-[info(17)]-14-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark no drive cell

-(void)config:(mnodrivetodayitemrestriction*)model
{
    [self.icon setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.title setText:model.title];
    [self.info setText:model.info];
}

@end