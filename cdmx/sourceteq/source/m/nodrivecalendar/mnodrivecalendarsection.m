#import "mnodrivecalendarsection.h"
#import "mnodrivecalendarsectionweek.h"
#import "mnodrivecalendarsectionsaturdays.h"
#import "mnodrivecalendarsectionforeigner.h"
#import "mnodrive.h"

@interface mnodrivecalendarsection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mnodrivecalendarsection

+(instancetype)week:(NSArray<mnodriveitem*>*)items
{
    
}

+(instancetype)saturdays:(NSArray<mnodriveitem*>*)items
{
    
}

+(instancetype)foreigner:(mnodrive*)nodrive
{
    
}

@end