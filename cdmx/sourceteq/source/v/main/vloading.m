#import "vloading.h"

@implementation vloading

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    self.layoutmargintop = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraint:self.layoutmargintop];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];

    
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