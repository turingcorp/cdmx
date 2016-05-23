#import "mnodrivecalendarsection.h"

@interface mnodrivecalendarsection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mnodrivecalendarsection

@end