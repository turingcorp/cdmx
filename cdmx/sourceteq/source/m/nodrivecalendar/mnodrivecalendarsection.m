#import "mnodrivecalendarsection.h"
#import "mnodrivecalendarsectionweek.h"
#import "mnodrivecalendarsectionsaturdays.h"
#import "mnodrivecalendarsectionforeigner.h"
#import "mnodrive.h"

@interface mnodrivecalendarsectionweek ()

+(instancetype)model:(NSArray<mnodriveitem*>*)week;

@end

@interface mnodrivecalendarsection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mnodrivecalendarsection

+(instancetype)week:(NSArray<mnodriveitem*>*)week
{
    mnodrivecalendarsection *model = [mnodrivecalendarsectionweek model:week];
    
    return model;
}

+(instancetype)saturdays:(NSArray<mnodriveitem*>*)saturdays
{
    return nil;
}

+(instancetype)foreigner:(mnodrive*)nodrive
{
    return nil;
}

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivecalendaritem*>*)items
{
    self = [self init];
    self.name = name;
    self.items = items;
    
    return self;
}

@end