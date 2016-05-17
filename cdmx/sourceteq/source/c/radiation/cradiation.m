#import "cradiation.h"
#import "cmain.h"
#import "vradiation.h"

@interface cradiation ()

@property(strong, nonatomic)vradiation *view;

@end

@implementation cradiation

@dynamic view;

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(void)loadView
{
    self.view = [[vradiation alloc] init:self];
}

#pragma mark public

-(void)menu
{
    [[cmain singleton].pages menu];
}

@end