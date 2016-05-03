#import <Foundation/Foundation.h>
#import "zqlparam.h"

@interface zqlquery:NSObject

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params;

@end