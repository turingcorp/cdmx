#import "vairdetail.h"
#import "vairdetailheader.h"
#import "vairdetailpay.h"
#import "vairdetailinfo.h"

static NSInteger const infoheight = 80;

@implementation vairdetail

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairdetailheader *header = [[vairdetailheader alloc] init:controller];
    
    vairdetailpay *pay = [[vairdetailpay alloc] init:controller.model.index];
    
    vairdetailinfo *info = [[vairdetailinfo alloc] init:controller.model];
    
    [self addSubview:header];
    [self addSubview:info];
    [self addSubview:pay];
    
    NSDictionary *views = @{@"header":header, @"pay":pay, @"info":info};
    NSDictionary *metrics = @{@"infoheight":@(infoheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[info]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[pay]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(230)]-0-[pay]-0-[info(infoheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end