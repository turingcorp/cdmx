#import "vpollutionpollutantdetail.h"
#import "vpollutionpollutantdetailbar.h"

static NSInteger const pollutantdetailbarheight = 150;

@implementation vpollutionpollutantdetail

-(instancetype)init:(cpollutionpollutantdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vpollutionpollutantdetailbar *bar = [[vpollutionpollutantdetailbar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{@"barheight":@(pollutantdetailbarheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end