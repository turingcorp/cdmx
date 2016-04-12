#import "cloading.h"
#import "vloading.h"

@interface cloading ()

@property(strong, nonatomic)vloading *view;

@end

@implementation cloading

@dynamic view;

-(void)loadView
{
    self.view = [[vloading alloc] init];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end