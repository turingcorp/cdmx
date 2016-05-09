#import <Foundation/Foundation.h>
#import "zqlparam.h"

@interface zqlquery:NSObject

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params;
+(instancetype)insert:(NSString*)tablename params:(NSArray<zqlparam*>*)params;
+(instancetype)select:(NSString*)tablename params:(NSArray<zqlparam*>*)params ordered:(zqlparam*)ordered ascendent:(BOOL)ascendent;
+(instancetype)begintransaction;
+(instancetype)committransaction;
+(instancetype)rollbacktransaction;

@property(copy, nonatomic, readonly)NSString *querystring;

@end