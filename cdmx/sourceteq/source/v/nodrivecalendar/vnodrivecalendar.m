#import "vnodrivecalendar.h"
#import "cnodrivecalendar.h"

@implementation vnodrivecalendar

-(instancetype)init:(cnodrivecalendar*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vnodrive_calendar_title", nil)];
    
    return self;
}

@end