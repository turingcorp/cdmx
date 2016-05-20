#import <Foundation/Foundation.h>
#import "mradiationaboutitem.h"

@interface mradiationaboutsection:NSObject

@property(strong, nonatomic, readonly)NSArray<mradiationaboutitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *info;

@end