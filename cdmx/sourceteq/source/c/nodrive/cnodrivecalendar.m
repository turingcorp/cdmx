#import "cnodrivecalendar.h"
#import "vnodrivecalendar.h"

@implementation cnodrivecalendar

-(void)loadView
{
    self.view = [[vnodrivecalendar alloc] init:self];
}

@end