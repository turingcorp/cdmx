#import <Foundation/Foundation.h>
#import "zqlpk.h"

@interface zqlrow:NSObject

@property(strong, nonatomic)NSArray<zqlparam*> *params;
@property(strong, nonatomic)zqlpk *primarykey;

@end