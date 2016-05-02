#import <Foundation/Foundation.h>

@interface NSNotification (enotification)

+(void)glkmove;
+(void)observe:(id)observer glkmove:(SEL)selector;

@end