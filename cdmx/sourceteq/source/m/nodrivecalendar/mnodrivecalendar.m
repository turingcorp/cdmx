#import "mnodrivecalendar.h"
#import "mnodrive.h"

@interface mnodrivecalendarsection ()

+(instancetype)week:(NSArray<mnodriveitem*>*)week;
+(instancetype)foreigner:(mnodrive*)nodrive;

@end

@interface mnodrivecalendar ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendarsection*> *sections;

@end

@implementation mnodrivecalendar

+(instancetype)model:(mnodrive*)model
{
    NSMutableArray<mnodrivecalendarsection*> *sections = [NSMutableArray array];
    
    mnodrivecalendarsection *sectionweek = [mnodrivecalendarsection week:model.week];
    mnodrivecalendarsection *sectionforeigner = [mnodrivecalendarsection foreigner:model];
    
    [sections addObject:sectionweek];
    [sections addObject:sectionforeigner];
    
    mnodrivecalendar *calendar = [[mnodrivecalendar alloc] init:sections];
    
    return calendar;
}

-(instancetype)init:(NSArray<mnodrivecalendarsection*>*)sections
{
    self = [super init];
    self.sections = sections;
    
    return self;
}

@end