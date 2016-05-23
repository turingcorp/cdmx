#import "mnodrivecalendarsectionweek.h"
#import "mnodrivecalendaritemweek.h"
#import "mnodriveitem.h"
#import "vnodrivecalendarcellweek.h"
#import "ecollectioncell.h"

static NSInteger const nodrivecalendarweekheight = 70;

@implementation mnodrivecalendarsectionweek

+(instancetype)model:(NSArray<mnodriveitem*>*)week
{
    NSString *name = NSLocalizedString(@"mnodrive_calendar_section_week", nil);
    NSMutableArray<mnodrivecalendaritem*> *items = [NSMutableArray array];
    NSUInteger countweek = week.count;
    
    for(NSUInteger indexweek = 0; indexweek < countweek; indexweek++)
    {
        mnodriveitem *weekday = week[indexweek];
        mnodrivecalendaritemweek *modelweekday = [[mnodrivecalendaritemweek alloc] init:plate];
        
        [items addObject:modelweekday];
    }
    
    mnodrivetodaysectionplate *model = [[mnodrivetodaysectionplate alloc] init:name items:items];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.reusableidentifier = [vnodrivecellplate reusableidentifier];
    self.cellclass = [vnodrivecellplate class];
    self.cellwidth = nodrivetodayplatewidth;
    self.cellheight = nodrivetodayplateheight;
    self.cellsperrow = nodrivetodayplatecellsperrow;
    self.fullwidth = NO;
    self.headerborder = YES;
    
    return self;
}

@end