#import <Foundation/Foundation.h>
#import "zqlresult.h"
#import "zqlquery.h"
#import "zqlconfig.h"

@interface zql:NSObject

+(nonnull zqlresult*)query:(nonnull NSArray<zqlquery*>*)querylist db:(nullable NSString*)dbpath;

@end