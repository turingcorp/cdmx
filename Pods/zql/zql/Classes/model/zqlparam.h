#import <Foundation/Foundation.h>
#import "zqltype.h"

@interface zqlparam:NSObject

+(instancetype)type:(zqltype*)type name:(NSString*)name value:(id)value;
-(NSString*)querycreate;
-(NSString*)queryvalue;

@property(strong, nonatomic)zqltype *type;
@property(strong, nonatomic)id value;
@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)BOOL unique;

@end