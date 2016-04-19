#import "snotpollution.h"

@implementation snotpollution

+(UILocalNotification*)notification
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    [notification setAlertBody:NSLocalizedString(@"notification_pollution", nil)];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    return notification;
}

@end