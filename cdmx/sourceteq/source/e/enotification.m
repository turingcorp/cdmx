#import "enotification.h"

static NSString* const notification_glkmove =               @"glkmove";
static NSString* const notification_glkdraw =               @"glkdraw";

@implementation NSNotification (enotification)

+(void)glkmove
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkmove object:nil];
}

+(void)glkmoveremove:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:notification_glkmove object:nil];
}

+(void)observe:(id)observer glkmove:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notification_glkmove object:nil];
}

+(void)glkdraw:(mpollutionnotificationdraw*)userinfo
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkdraw object:nil userInfo:userinfo];
}

+(void)glkdrawremove:(id)observer
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:notification_glkdraw object:nil];
}

+(void)observe:(id)observer glkdraw:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:notification_glkdraw object:nil];
}

@end