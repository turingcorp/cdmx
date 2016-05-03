#import <Foundation/Foundation.h>

@interface zqltype:NSObject

+(instancetype)integer;
+(instancetype)text;

@property(copy, nonatomic)NSString *name;

@end