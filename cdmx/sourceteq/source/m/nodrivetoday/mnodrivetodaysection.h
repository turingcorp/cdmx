#import <Foundation/Foundation.h>
#import "mnodrivetodayitem.h"
#import "mnodriveitemplate.h"

@interface mnodrivetodaysection:NSObject

+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates;

@property(strong, nonatomic, readonly)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *reusableidentifier;
@property(assign, nonatomic, readonly)Class cellclass;
@property(assign, nonatomic, readonly)NSInteger cellwidth;
@property(assign, nonatomic, readonly)NSInteger cellheight;
@property(assign, nonatomic, readonly)BOOL fullwidth;

@end