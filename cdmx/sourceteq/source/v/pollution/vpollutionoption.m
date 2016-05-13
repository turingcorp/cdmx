#import "vpollutionoption.h"

static CGFloat const animationduration = 0.4;

@implementation vpollutionoption

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    self.controller = controller;
    
    __weak typeof(self) welf = self;
    
    [UIView animateWithDuration:animationduration animations:
     ^
     {
         [welf setAlpha:1];
     } completion:
     ^(BOOL done)
     {
         [welf didappear];
     }];
    
    return self;
}

#pragma mark public

-(void)remove
{
    __weak typeof(self) welf = self;
    
    [UIView animateWithDuration:animationduration animations:
     ^
     {
         [welf setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [welf removeFromSuperview];
     }];
}

-(void)didappear
{
}

@end