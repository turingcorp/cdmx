#import "mnodrivecalendarsectionweek.h"
#import "mnodrivecalendaritemweek.h"
#import "mnodriveitem.h"
#import "vnodrivecalendarcellweek.h"
#import "ecollectioncell.h"

static NSInteger const nodrivecalendarweekheight = 70;

@interface mnodrivecalendaritemweek ()

-(instancetype)init:(NSInteger)day platea:(mnodriveitemplate*)platea plateb:(mnodriveitemplate*)plateb;

@end

@interface mnodrivecalendarsection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivecalendaritem*>*)items;

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mnodrivecalendarsectionweek

+(instancetype)model:(NSArray<mnodriveitem*>*)week
{
    NSString *name = NSLocalizedString(@"mnodrive_calendar_section_week", nil);
    NSMutableArray<mnodrivecalendaritem*> *items = [NSMutableArray array];
    NSUInteger countweek = week.count;
    
    for(NSUInteger indexweek = 0; indexweek < countweek; indexweek++)
    {
        mnodriveitem *weekday = week[indexweek];
        
        if(weekday.plates.count > 1)
        {
            mnodriveitemplate *platea = weekday.plates[0];
            mnodriveitemplate *plateb = weekday.plates[1];
            mnodrivecalendaritemweek *modelweekday = [[mnodrivecalendaritemweek alloc] init:indexweek platea:platea plateb:plateb];
            [items addObject:modelweekday];
        }
    }
    
    mnodrivecalendarsectionweek *model = [[mnodrivecalendarsectionweek alloc] init:name items:items];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.reusableidentifier = [vnodrivecalendarcellweek reusableidentifier];
    self.cellclass = [vnodrivecalendarcellweek class];
    self.cellheight = nodrivecalendarweekheight;
    
    return self;
}

@end