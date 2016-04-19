#import "vairdetail.h"
#import "vairdetailheader.h"
#import "vairdetailpay.h"

@implementation vairdetail

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairdetailheader *header = [[vairdetailheader alloc] init:controller];
    
    vairdetailpay *pay = [[vairdetailpay alloc] init];
    
    [self addSubview:header];
    [self addSubview:pay];
    
    NSDictionary *views = @{@"header":header, @"pay":pay};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[pay]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(230)]-0-[pay]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end