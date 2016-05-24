#import <Foundation/Foundation.h>
#import "mmenusectionitem.h"

@interface mmenusection:NSObject

@property(strong, nonatomic, readonly)NSArray<mmenusectionitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;

@end