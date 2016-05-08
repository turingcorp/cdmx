#import "cpollution.h"
#import "enotification.h"
#import "cpollutionimeca.h"
#import "cmain.h"
#import "vpollution.h"
#import <zql/zql.h>

static NSInteger const framespersecond = 60;

@implementation cpollution

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
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:YES];
    [self setDelegate:self];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view viewdidappear];
    
    [[zqlconfig shared] createdb:@"cdmx"];
    //[[zqlconfig shared] startdb:@"cdmx"];
    NSMutableArray<zqlparam*> *params = [NSMutableArray array];
    [params addObject:[zqlparam type:[zqltype integer] name:@"created" value:nil]];
    [params addObject:[zqlparam type:[zqltype text] name:@"name" value:nil]];
    zqlquery *query = [zqlquery createtable:@"changui" params:params];
    zqlresult *result = [zql query:query];
    
    if(result.success)
    {
        NSLog(@"success");
    }
    else
    {
        NSLog(@"error");
    }
}

-(void)loadView
{
    self.view = [[vpollution alloc] init:self];
}

#pragma mark public

-(void)imeca
{
    cpollutionimeca *controller = [[cpollutionimeca alloc] init];
    [[cmain singleton] pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [NSNotification glkmove];
}

@end