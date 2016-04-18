#import "cairgeo.h"
#import "vairgeo.h"

@interface cairgeo ()

@property(strong, nonatomic)vairgeo *view;

@end

@implementation cairgeo

@dynamic view;

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    if(!self.view.map.delegate)
    {
        [self.view loadmap];
    }
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
    NSLog(@"%@", item.name);
}

@end