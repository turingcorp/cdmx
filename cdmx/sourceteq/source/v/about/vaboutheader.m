#import "vaboutheader.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vaboutheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setFont:[UIFont regularsize:40]];
    [labeltitle setTextColor:[UIColor second]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setText:NSLocalizedString(@"app_name", nil)];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:labeltitle];
    
    UILabel *labelcopy = [[UILabel alloc] init];
    [labelcopy setBackgroundColor:[UIColor clearColor]];
    [labelcopy setFont:[UIFont regularsize:15]];
    [labelcopy setTextColor:[UIColor second]];
    [labelcopy setTextAlignment:NSTextAlignmentCenter];
    [labelcopy setText:NSLocalizedString(@"app_copy", nil)];
    [labelcopy setUserInteractionEnabled:NO];
    [labelcopy setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:labeltitle];
    [self addSubview:labelcopy];
    
    NSDictionary *views = @{@"title":labeltitle, @"copy":labelcopy};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[copy]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[copy(35)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end