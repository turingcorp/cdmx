#import "vhome.h"

@interface vhome ()

@property(weak, nonatomic)chome *controller;

@end

@implementation vhome

@dynamic controller;

-(instancetype)init:(chome*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    
    UIButton *buttonplay = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 40)];
    [buttonplay setBackgroundColor:[UIColor blackColor]];
    [buttonplay setTitle:@"Play" forState:UIControlStateNormal];
    [buttonplay addTarget:self action:@selector(actionplay:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttonplay];
    
    return self;
}

#pragma mark actions

-(void)actionplay:(UIButton*)button
{
    [self.controller play];
}

@end