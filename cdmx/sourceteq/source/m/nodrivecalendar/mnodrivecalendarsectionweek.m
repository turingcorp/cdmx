#import "mnodrivecalendarsectionweek.h"
#import "mnodriveitem.h"
#import "vnodrivecellplate.h"
#import "ecollectioncell.h"

static NSInteger const nodrivetodayplatewidth = 70;
static NSInteger const nodrivetodayplateheight = 70;
static NSInteger const nodrivetodayplatecellsperrow = 2;

@implementation mnodrivecalendarsectionweek

+(instancetype)model:(NSArray<mnodriveitem*>*)items
{
    NSString *name = NSLocalizedString(@"mnodrive_today_section_plate", nil);
    NSMutableArray<mnodrivetodayitemplate*> *items = [NSMutableArray array];
    NSUInteger countplates = plates.count;
    
    for(NSUInteger indexplate = 0; indexplate < countplates; indexplate++)
    {
        mnodriveitemplate *plate = plates[indexplate];
        mnodrivetodayitemplate *modelplate = [[mnodrivetodayitemplate alloc] init:plate];
        [items addObject:modelplate];
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