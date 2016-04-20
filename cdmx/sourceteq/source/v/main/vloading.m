#import "vloading.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

@implementation vloading

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    UIView *topbar = [[UIView alloc] init];
    [topbar setUserInteractionEnabled:NO];
    [topbar setClipsToBounds:YES];
    [topbar setBackgroundColor:[[UIColor main] colorWithAlphaComponent:0.5]];
    [topbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:topbar];
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner, @"topbar":topbar};
    NSDictionary *metrics = @{@"barheight":@(navbarheightmin)};
    
    self.layoutmargintop = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:self.layoutmargintop];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[topbar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[topbar(barheight)]" options:0 metrics:metrics views:views]];

    
    return self;
}

-(void)layoutSubviews
{
    CGFloat height = self.bounds.size.height;
    CGFloat remain = height - spinnerintrinsicsize;
    CGFloat margin = remain / 2.0;
    self.layoutmargintop.constant = margin;
    
    [super layoutSubviews];
}

@end