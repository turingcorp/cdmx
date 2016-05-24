#import <Foundation/Foundation.h>
#import "mpollutionnotificationdraw.h"

@interface NSNotification (enotification)

+(void)glkmove;
+(void)observe:(id)observer glkmove:(SEL)selector;
+(void)glkmoveremove:(id)observer;
+(void)glkdraw:(mpollutionnotificationdraw*)userinfo;
+(void)glkdrawremove:(id)observer;
+(void)observe:(id)observer glkdraw:(SEL)selector;
+(void)observe:(id)observer becomeactive:(SEL)selector;
+(void)becomeactiveremove:(id)observer;

@end