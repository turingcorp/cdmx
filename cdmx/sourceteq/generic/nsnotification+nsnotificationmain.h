#import <Foundation/Foundation.h>

@interface NSNotification (nsnotificationmain)

+(void)stationsloaded;
+(void)observe:(id)observer stationsloaded:(SEL)selector;

@end