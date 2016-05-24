#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface zqltype:NSObject

+(instancetype)integer;
+(instancetype)floatnum;
+(instancetype)text;
+(instancetype)blob;
+(instancetype)nulltype;
+(instancetype)fromsqltype:(NSInteger)sqltype;
-(NSString*)queryvalue:(id)value;
-(NSString*)createquery;
-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column;

@property(copy, nonatomic)NSString *name;

@end