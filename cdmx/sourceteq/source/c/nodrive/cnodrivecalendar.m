#import "cnodrivecalendar.h"
#import "vnodrivecalendar.h"

@interface cnodrivecalendar ()

@property(strong, nonatomic, readwrite)mnodrive *model;
@property(strong, nonatomic)vnodrivecalendar *view;

@end

@implementation cnodrivecalendar

@dynamic view;

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!self.view.model)
    {
        __weak typeof(self) welf = self;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           mnodrivecalendar *modelcalendar = [welf.model modelcalendar];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.view modelcalendar:modelcalendar];
                                          });
                       });
    }
}

-(void)loadView
{
    self.view = [[vnodrivecalendar alloc] init:self];
}

@end