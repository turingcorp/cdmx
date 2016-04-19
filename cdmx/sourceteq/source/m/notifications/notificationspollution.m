#import "notificationspollution.h"

@implementation notificationspollution

-(instancetype)init
{
    self = [super init];
    [self setAlertBody:NSLocalizedString(@"notification_pollution", nil)];
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:20]];
    
    return self;
}

@end