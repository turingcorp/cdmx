#import <Foundation/Foundation.h>
#import "mstationsitem.h"
#import "mstationsreading.h"
#import "acalldelegate.h"
#import "mstationsnodrive.h"

@interface mstations:NSObject<acalldelegate>

+(instancetype)singleton;
-(void)load;

@property(strong, nonatomic)mstationsnodrive *nodrive;
@property(strong, nonatomic)NSArray<mstationsitem*> *items;
@property(strong, nonatomic)NSMutableArray<mstationsreading*> *readings;
@property(nonatomic)BOOL loaded;

@end