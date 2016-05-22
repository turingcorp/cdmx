#import <Foundation/Foundation.h>
#import "mnodrivetodayitem.h"

@interface mnodrivetodaysection:NSObject

@property(strong, nonatomic, readonly)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;

@end