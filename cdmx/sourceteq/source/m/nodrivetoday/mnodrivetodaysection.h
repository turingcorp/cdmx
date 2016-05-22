#import <Foundation/Foundation.h>
#import "mnodrivetodayitem.h"
#import "mnodriveitemplate.h"

@interface mnodrivetodaysection:NSObject

+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates;

@property(strong, nonatomic, readonly)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;

@end