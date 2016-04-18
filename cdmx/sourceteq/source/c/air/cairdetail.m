#import "cairdetail.h"
#import "vairdetail.h"

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
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

@end