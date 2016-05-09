#import <Foundation/Foundation.h>
#import "zqlresultparams.h"

@interface zqlresult:NSObject

+(instancetype)errornodb;
+(instancetype)sqlresponse:(NSInteger)responsenumber;
+(instancetype)lastinsert:(NSInteger)insertid;
-(zqlresult*)merge:(zqlresult*)result;

@property(strong, nonatomic, readonly)NSMutableArray<zqlresultparams*> *params;
@property(assign, nonatomic)NSInteger lastinsertid;
@property(assign, nonatomic)BOOL success;
@property(assign, nonatomic)BOOL moresteps;

@end