#import <Foundation/Foundation.h>
#import "mnodrivetodaysection.h"

@class mnodrive;

@interface mnodrivetoday:NSObject

+(instancetype)model:(mnodrive*)model;

@property(strong, nonatomic, readonly)NSArray<mnodrivetodaysection*> *sections;

@end