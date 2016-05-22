#import <Foundation/Foundation.h>
#import "mnodrivetodayitem.h"
#import "mnodriveitemplate.h"
#import "mnodriverating.h"

@interface mnodrivetodaysection:NSObject

@property(strong, nonatomic, readonly)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *reusableidentifier;
@property(assign, nonatomic, readonly)Class cellclass;
@property(assign, nonatomic, readonly)NSInteger cellwidth;
@property(assign, nonatomic, readonly)NSInteger cellheight;
@property(assign, nonatomic, readonly)NSInteger cellsperrow;
@property(assign, nonatomic, readonly)BOOL fullwidth;
@property(assign, nonatomic, readonly)BOOL headerborder;

@end