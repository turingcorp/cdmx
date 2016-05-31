#import <UIKit/UIKit.h>
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"
#import "mdbecobicistation.h"

@interface mdbselect:NSObject

+(NSArray<mdbdistrict*>*)district;
+(NSArray<mdbpollutiondaily*>*)pollutiondaily;
+(mdbpollutiondaily*)lastpollutiondaily;
+(NSArray<mdbecobicistation*>*)ecobicistations;

@end