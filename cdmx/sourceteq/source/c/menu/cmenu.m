#import "cmenu.h"
#import "vmenu.h"

@interface cmenu ()

@property(strong, nonatomic)vmenu *view;

@end

@implementation cmenu

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(void)loadView
{
    self.view = [[vmenu alloc] init:self];
}

@end