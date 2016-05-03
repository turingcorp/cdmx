#import <Foundation/Foundation.h>
#import "mpollutionnotificationdraw.h"

@interface NSNotification (enotification)

+(void)glkmove;
+(void)observe:(id)observer glkmove:(SEL)selector;
+(void)glkdraw:(mpollutionnotificationdraw*)userinfo;
+(void)observe:(id)observer glkdraw:(SEL)selector;

@end