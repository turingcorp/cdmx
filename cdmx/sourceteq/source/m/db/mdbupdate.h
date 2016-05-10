#import <Foundation/Foundation.h>
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"

@interface mdbupdate:NSObject

+(void)districtspollution:(NSArray<mdbdistrict*>*)districts;
+(void)dailypollution:(NSArray<mdbpollutiondaily*>*)districts;

@end