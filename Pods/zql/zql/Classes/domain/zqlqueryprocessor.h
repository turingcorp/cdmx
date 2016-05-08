#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "zqlquery.h"
#import "zqlresult.h"

@interface zqlqueryprocessor:NSObject

-(instancetype)init:(zqlquery*)query;
-(zqlresult*)prepare:(sqlite3*)sqlite;
-(zqlresult*)step;
-(zqlresult*)finalizestatement;
-(void)lastinsert:(sqlite3*)sqlite result:(zqlresult*)result;

@end