#import "nsnotification+nsnotificationmain.h"

static NSString* const notification_stationsloaded =       @"stationsloaded";

@implementation NSNotification (nsnotificationmain)

+(void)stationsloaded
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_stationsloaded object:nil];
}

+(void)observe:(id)observer stationsloaded:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notification_stationsloaded object:nil];
}

@end