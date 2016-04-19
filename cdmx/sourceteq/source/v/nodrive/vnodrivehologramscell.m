#import "vnodrivehologramscell.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

static CGFloat const cornerradius = 6.0;

@implementation vnodrivehologramscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor main]];
    [self.layer setCornerRadius:cornerradius];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldsize:30]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setFont:[UIFont regularsize:14]];
    [labelname setTextAlignment:NSTextAlignmentCenter];
    [labelname setTextColor:[UIColor whiteColor]];
    [labelname setUserInteractionEnabled:NO];
    [labelname setNumberOfLines:0];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelname = labelname;
    
    [self addSubview:labelname];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"labelname":labelname};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[labelname]-4-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labelname(30)]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mstationsnodrivehologram*)model
{
    [self.label setText:model.symbol];
    [self.labelname setText:model.name];
}

@end