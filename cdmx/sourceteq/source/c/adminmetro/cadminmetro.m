#import "cadminmetro.h"
#import "vadminmetro.h"

@interface cadminmetro ()

@property(strong, nonatomic)vadminmetro *view;
@property(strong, nonatomic, readwrite)madminmetro *model;

@end

@implementation cadminmetro

@dynamic view;

-(void)loadView
{
    self.view = [[vadminmetro alloc] init:self];
}

#pragma mark public

-(void)createdatabase
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       welf.model = [[madminmetro alloc] init];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.view modelcreated];
                                      });
                   });
}

@end