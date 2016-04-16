#import <Foundation/Foundation.h>
#import "mstationsitem.h"
#import "mstationsreading.h"
#import "acalldelegate.h"
#import "mstationsnodrive.h"
#import "mstationsreadinguv.h"

@interface mstations:NSObject<acalldelegate>

+(instancetype)singleton;
-(void)fetch;
-(void)load;

@property(strong, nonatomic)mstationsnodrive *nodrive;
@property(strong, nonatomic)mstationsreadinguv *uv;
@property(strong, nonatomic)mstationsreadingitemindex *worstindex;
@property(strong, nonatomic)mstationsreadingitemconditions *generalconditions;
@property(strong, nonatomic)NSArray<mstationsitem*> *items;
@property(strong, nonatomic)NSMutableArray<mstationsreading*> *readings;
@property(copy, nonatomic)NSString *error;

@end