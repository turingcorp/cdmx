#import <Foundation/Foundation.h>
#import "zqlresult.h"
#import "zqlquery.h"
#import "zqlconfig.h"

@interface zql:NSObject

+(zqlresult*)query:(zqlquery*)query;

@end