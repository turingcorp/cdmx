#import <Foundation/Foundation.h>
#import "zqlparam.h"

@interface zqlquery:NSObject

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params;
+(instancetype)insert:(NSString*)tablename params:(NSArray<zqlparam*>*)params;
+(instancetype)replace:(NSString*)tablename params:(NSArray<zqlparam*>*)params;
+(instancetype)update:(NSString*)tablename params:(NSArray<zqlparam*>*)params where:(zqlparam*)where;
+(instancetype)select:(NSString*)tablename params:(NSArray<zqlparam*>*)params ordered:(zqlparam*)ordered ascendent:(BOOL)ascendent limit:(NSInteger)limit;
+(instancetype)begintransaction;
+(instancetype)committransaction;
+(instancetype)rollbacktransaction;

@property(copy, nonatomic, readonly)NSString *querystring;

@end