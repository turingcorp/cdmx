#import "vairdetail.h"
#import "vairdetailheader.h"


@implementation vairdetail

-(instancetype)init:(cairdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vairdetailheader *header = [[vairdetailheader alloc] init:controller];
    
    [self addSubview:header];
    
    NSDictionary *views = @{@"header":header};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(120)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end