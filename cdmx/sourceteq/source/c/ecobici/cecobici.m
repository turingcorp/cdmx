#import "cecobici.h"
#import "cmain.h"
#import "vecobici.h"
#import "analytics.h"

@interface cecobici ()

@property(strong, nonatomic)vecobici *view;
@property(weak, nonatomic, readonly)cmain *parentViewController;
@property(strong, nonatomic, readwrite)mecobici *model;

@end

@implementation cecobici

@dynamic view;
@dynamic parentViewController;

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadecobici];
}

-(void)loadView
{
    self.view = [[vecobici alloc] init:self];
}

#pragma mark public

-(void)loadecobici
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       
                   });
    
    [[analytics singleton] trackscreen:self];
}

-(void)menu
{
    [self.parentViewController menu];
}

-(void)centeruser
{
    
}

-(void)centercloserstation
{
    
}

@end