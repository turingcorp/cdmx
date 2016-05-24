#import <Foundation/Foundation.h>
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"

@interface mdbupdate:NSObject

+(void)pollutiondistricts:(NSArray<mdbdistrict*>*)districts daily:(NSArray<mdbpollutiondaily*>*)daily;

@end