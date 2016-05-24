#import <Foundation/Foundation.h>

@interface mradiationactivity:NSObject

+(instancetype)exercise:(BOOL)allowed;
+(instancetype)transport:(BOOL)allowed;
+(instancetype)outdoors:(BOOL)allowed;
+(instancetype)cafe:(BOOL)allowed;

@property(copy, nonatomic, readonly)NSString *asset;
@property(copy, nonatomic, readonly)NSString *name;
@property(assign, nonatomic, readonly)BOOL allowed;

@end