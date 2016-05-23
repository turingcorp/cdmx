#import "cnodrivecalendar.h"
#import "vnodrivecalendar.h"

@interface cnodrivecalendar ()

@property(strong, nonatomic, readwrite)mnodrive *model;

@end

@implementation cnodrivecalendar

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)loadView
{
    self.view = [[vnodrivecalendar alloc] init:self];
}

@end