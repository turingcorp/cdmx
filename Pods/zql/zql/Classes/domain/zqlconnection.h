#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface zqlconnection:NSObject

-(NSInteger)connect:(sqlite3**)sqlite;
-(NSInteger)close:(sqlite3**)sqlite;

@end