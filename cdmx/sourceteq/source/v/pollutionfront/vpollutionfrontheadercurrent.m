#import "vpollutionfrontheadercurrent.h"
#import "efont.h"

static NSInteger const buttonheight = 45;

@implementation vpollutionfrontheadercurrent

-(instancetype)init
{
    self = [super init];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:14]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    self.labeltitle = labeltitle;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setTintColor:[UIColor colorWithWhite:0.5 alpha:1]];
    
    [self addSubview:labeltitle];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"title":labeltitle, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(40)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[icon(21)]-12-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, buttonheight);
    
    return size;
}

#pragma mark public

-(void)config:(mpollutionfrontitem*)model
{
    [self.labeltitle setText:model.name];
}

@end