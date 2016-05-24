#import <UIKit/UIKit.h>
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"

@interface mdbselect:NSObject

+(NSArray<mdbdistrict*>*)district;
+(NSArray<mdbpollutiondaily*>*)pollutiondaily;
+(mdbpollutiondaily*)lastpollutiondaily;

@end