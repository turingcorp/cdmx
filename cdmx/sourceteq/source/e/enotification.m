#import "enotification.h"

static NSString* const notification_glkmove =           @"glkmove";

@implementation NSNotification (enotification)

+(void)glkmove
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkmove object:nil];
}

+(void)observe:(id)observer glkmove:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notification_glkmove object:nil];
}

@end