#import "vnodrivecellrestriction.h"
#import "mnodrivetodayitemrestriction.h"
#import "ecolor.h"
#import "efont.h"

@implementation vnodrivecellrestriction

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:[UIColor main]];
    self.icon = icon;
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextColor:[UIColor colorWithWhite:0.1 alpha:1]];
    [title setFont:[UIFont boldsize:12]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setUserInteractionEnabled:NO];
    self.title = title;
    
    UILabel *info = [[UILabel alloc] init];
    [info setBackgroundColor:[UIColor clearColor]];
    [info setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    [info setFont:[UIFont regularsize:14]];
    [info setTranslatesAutoresizingMaskIntoConstraints:NO];
    [info setUserInteractionEnabled:NO];
    self.info = info;
    
    [self addSubview:icon];
    [self addSubview:title];
    [self addSubview:info];
    
    NSDictionary *views = @{@"icon":icon, @"title":title, @"info":info};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[icon(30)]-7-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon]-7-[info]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(14)]-0-[info(16)]-10-|" options:0 metrics:metrics views:views]];
    
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