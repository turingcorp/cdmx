#import <Foundation/Foundation.h>
#import "mnodrivetodayitem.h"
#import "mnodrive.h"

@interface mnodrivetodayitemrestriction:mnodrivetodayitem

@property(copy, nonatomic, readonly)NSString *asset;
@property(copy, nonatomic, readonly)NSString *title;
@property(copy, nonatomic, readonly)NSString *info;

@end