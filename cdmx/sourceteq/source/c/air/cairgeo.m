#import "cairgeo.h"
#import "vairgeo.h"
#import "cairdetail.h"
#import "analytics.h"

@interface cairgeo ()

@property(strong, nonatomic)vairgeo *view;

@end

@implementation cairgeo

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_environment_geo];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.prevgesturedelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    if(!self.view.map.delegate)
    {
        [self.view loadmap];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self.prevgesturedelegate;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vairgeo alloc] init:self];
}

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)centeruser
{
    [self.view centeruser];
}

-(void)selectitem:(mstationsreadingitem*)item
{
    cairdetail *controller = [[cairdetail alloc] init:item];
    [self.navigationController pushViewController:controller animated:YES];
}

@end