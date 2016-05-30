#import "cadminecobici.h"
#import "vadminecobici.h"
#import "aparseradminecobici.h"
#import "enotification.h"

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
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              if(currentpage)
                                              {
                                                  [welf.view succeded];
                                              }
                                              else
                                              {
                                                  [welf.view error:NSLocalizedString(@"vadmin_ecobici_error_reponse", nil)];
                                              }
                                          });
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