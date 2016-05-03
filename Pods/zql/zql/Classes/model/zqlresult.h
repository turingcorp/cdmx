#import <Foundation/Foundation.h>

@interface zqlresult:NSObject

+(instancetype)errornodb;
+(instancetype)error:(NSInteger)errornumber;

@end