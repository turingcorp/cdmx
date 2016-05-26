#import "vpollutionfrontheadercell.h"
#import "efont.h"

@implementation vpollutionfrontheadercell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont regularsize:14]];
    [label setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionfrontitemoption*)option
{
    [self.label setText:option.name];
}

@end