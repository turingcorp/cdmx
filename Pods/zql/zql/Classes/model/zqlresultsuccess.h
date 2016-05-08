#import <Foundation/Foundation.h>
#import "zqlresult.h"

@interface zqlresultsuccess:zqlresult

-(instancetype)init:(BOOL)moresteps;

@property(assign, nonatomic)NSInteger lastinsertid;
@property(assign, nonatomic)BOOL moresteps;

@end