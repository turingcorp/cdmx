#import "snotpollution.h"

static NSInteger const secondsinterval = 3600;
static NSInteger const endinghour = 18;
static NSInteger const startinghour = 9;

@implementation snotpollution

+(UILocalNotification*)notification
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate *date;
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:now];
    NSInteger currenthour = components.hour;
    
    if(currenthour > endinghour || currenthour < startinghour)
    {
        date = [snotpollution tomorrowdate];
    }
    else
    {
        date = [NSDate dateWithTimeIntervalSinceNow:secondsinterval];
    }
    
    [notification setAlertBody:NSLocalizedString(@"notification_pollution", nil)];
    [notification setFireDate:date];
    
    return notification;
}

#pragma mark private

+(NSDate*)tomorrowdate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *tomorrow;
    NSDate* now = [NSDate date];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSDateComponents *componentstomorrow;
    NSCalendarUnit units = NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit;
    
    components.day = 1;
    tomorrow = [calendar dateByAddingComponents:components toDate:now options:0];
    componentstomorrow = [calendar components:units fromDate:tomorrow];
    componentstomorrow.hour = startinghour;
    tomorrow = [calendar dateFromComponents:componentstomorrow];
    
    return tomorrow;
}

@end