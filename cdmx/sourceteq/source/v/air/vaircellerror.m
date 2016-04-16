#import "vaircellerror.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vaircellerror

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    [label setFont:[UIFont regularsize:18]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor second]];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"air_button_retry", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldsize:16]];
    [button.layer setCornerRadius:4];
    [button addTarget:self action:@selector(actionretry:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]-0-[button(34)]-30-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionretry:(UIButton*)button
{
    [self.view retry];
}

#pragma mark public

-(void)config:(vair*)view error:(NSString*)error
{
    self.view = view;
    [self.label setText:error];
}

@end