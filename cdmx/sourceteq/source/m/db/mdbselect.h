#import <Foundation/Foundation.h>
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"

@interface mdbselect:NSObject

+(NSArray<mdbdistrict*>*)district;
+(NSArray<mdbpollutiondaily*>*)pollutiondaily;

@end