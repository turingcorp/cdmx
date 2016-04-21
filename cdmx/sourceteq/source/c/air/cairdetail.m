#import "cairdetail.h"
#import "vairdetail.h"
#import "analytics.h"

@interface cairdetail ()

@property(strong, nonatomic)vairdetail *view;

@end

@implementation cairdetail

@dynamic view;

-(instancetype)init:(mstationsreadingitem*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_environment_detail];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
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
    self.view = [[vairdetail alloc] init:self];
}

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end