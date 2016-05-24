#import <Foundation/Foundation.h>
#import "mnodrivecalendarsection.h"

@class mnodrive;

@interface mnodrivecalendar:NSObject

+(instancetype)model:(mnodrive*)model;

@property(strong, nonatomic, readonly)NSArray<mnodrivecalendarsection*> *sections;

@end