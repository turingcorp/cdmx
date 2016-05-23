#import "mnodrivecalendar.h"

@interface mnodrivecalendar ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendarsection*> *sections;

@end

@implementation mnodrivecalendar

+(instancetype)model:(mnodrive*)model
{
    NSMutableArray<mnodrivecalendarsection*> *sections = [NSMutableArray array];
    
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