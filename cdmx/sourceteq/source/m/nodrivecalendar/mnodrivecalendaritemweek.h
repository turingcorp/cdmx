#import <UIKit/UIKit.h>
#import "mnodrivecalendaritem.h"

@interface mnodrivecalendaritemweek:mnodrivecalendaritem

@property(strong, nonatomic, readonly)UIColor *color;
@property(copy, nonatomic, readonly)NSString *day;
@property(copy, nonatomic, readonly)NSString *numbera;
@property(copy, nonatomic, readonly)NSString *numberb;
@property(assign, nonatomic, readonly)BOOL permit;

@end