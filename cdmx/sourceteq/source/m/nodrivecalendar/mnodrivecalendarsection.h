#import <Foundation/Foundation.h>
#import "mnodrivecalendaritem.h"

@interface mnodrivecalendarsection:NSObject

@property(strong, nonatomic, readonly)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *reusableidentifier;
@property(assign, nonatomic, readonly)Class cellclass;
@property(assign, nonatomic, readonly)NSInteger cellheight;

@end