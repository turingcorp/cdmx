#import "cadminecobici.h"
#import "vadminecobici.h"
#import "aparseradminecobici.h"
#import "enotification.h"
#import "mdbadminecobici.h"

@interface ccontroller ()

@property(strong, nonatomic)vadminecobici *view;

@end

@interface cadminecobici ()

@property(strong, nonatomic, readwrite)madminecobici *model;

@end

@implementation cadminecobici
{
    NSInteger currentpage;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self pullecobicidata];
    
    [NSNotification becomeactiveremove:self];
    [NSNotification observe:self becomeactive:@selector(notifiedbecomeactive:)];
}

-(void)loadView
{
    self.view = [[vadminecobici alloc] init:self];
}

#pragma mark notified

-(void)notifiedbecomeactive:(NSNotification*)notification
{
    [self pullecobicidata];
}

#pragma mark private

-(void)pull
{
    [self.apimanager cancelcall];
    self.apimanager = [amanager call:[acall adminecobici:currentpage] delegate:self];
}

-(void)createdatabase
{
    __weak typeof(self) welf = self;
    NSURL *dburl = [mdbadminecobici createecobicidb:[self.model dbmodel]];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.view succeded:dburl];
                   });
}

#pragma mark public

-(void)pullecobicidata
{
    currentpage = 0;
    self.model = [[madminecobici alloc] init];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf pull];
                   });
}

-(void)exportdb
{
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[self.view.dburl] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = self.view;
        act.popoverPresentationController.sourceRect = CGRectMake(50, 50, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }
    
    [self presentViewController:act animated:YES completion:nil];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparseradminecobici *parser = (aparseradminecobici*)manager.call.parser;
                       
                       if(parser.stations.count)
                       {
                           [welf.model append:parser.stations];
                           currentpage++;
                           
                           [welf pull];
                       }
                       else
                       {
                           if(currentpage)
                           {
                               [welf createdatabase];
                           }
                           else
                           {
                               dispatch_async(dispatch_get_main_queue(),
                                              ^
                                              {
                                                  [welf.view error:NSLocalizedString(@"vadmin_ecobici_error_reponse", nil)];
                                              });
                           }
                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.model = nil;
                       [welf.view error:error];
                   });
}

@end