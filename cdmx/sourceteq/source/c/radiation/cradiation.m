#import "cradiation.h"
#import "cmain.h"
#import "vradiation.h"
#import "aparserradiation.h"

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadradiation];
}

-(void)loadView
{
    self.view = [[vradiation alloc] init:self];
}

#pragma mark functionality

-(void)loadradiation
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf.apimanager cancelcall];
                       welf.apimanager = [amanager call:[acall radiation] delegate:welf];
                   });
}

#pragma mark public

-(void)menu
{
    [[cmain singleton].pages menu];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparserradiation *parser = (aparserradiation*)manager.call.parser;
                       
                       if(parser.radiation)
                       {
                           [welf.view radiationloaded:parser.radiation];
                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
#warning "treat error";
}

@end