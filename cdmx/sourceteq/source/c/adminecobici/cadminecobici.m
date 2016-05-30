#import "cadminecobici.h"
#import "vadminecobici.h"
#import "aparseradminecobici.h"

@interface cadminecobici ()

@property(strong, nonatomic, readwrite)madminecobici *model;

@end

@implementation cadminecobici
{
    NSInteger currentpage;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[madminecobici alloc] init];
}

-(void)loadView
{
    self.view = [[vadminecobici alloc] init:self];
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
                       [welf.apimanager cancelcall];
                       welf.apimanager = [amanager call:[acall climate] delegate:welf];
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
                       
                       if(parser.climate)
                       {
                           welf.model = parser.climate;
                           mclimatecurrent *modelcurrent = [welf.model current];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.view climateloaded:modelcurrent];
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