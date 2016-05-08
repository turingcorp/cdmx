#import <Foundation/Foundation.h>

@interface zqlresult:NSObject

+(instancetype)errornodb;
+(instancetype)sqlresponse:(NSInteger)responsenumber;

@property(assign, nonatomic)BOOL success;

@end