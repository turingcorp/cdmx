#import "mnodrivecalendarsectionforeigner.h"
#import "mnodrivecalendaritemforeigner.h"
#import "mnodrive.h"
#import "vnodrivecalendarcellforeigner.h"
#import "ecollectioncell.h"

static NSInteger const nodrivecalendarforeignerheight = 80;

@interface mnodrivecalendaritemforeigner ()

+(instancetype)same;
+(instancetype)plates;
+(instancetype)mornings;
+(instancetype)saturdays;

@end

@interface mnodrivecalendarsection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivecalendaritem*>*)items;

@property(strong, nonatomic, readwrite)NSArray<mnodrivecalendaritem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mnodrivecalendarsectionforeigner

+(instancetype)model:(mnodrive*)nodrive
{
    NSString *name = NSLocalizedString(@"mnodrive_calendar_section_foreigner", nil);
    NSMutableArray<mnodrivecalendaritem*> *items = [NSMutableArray array];
    
    if(nodrive.allstates)
    {
        mnodrivecalendaritem *modelsame = [mnodrivecalendaritemforeigner same];
        [items addObject:modelsame];
    }
    else
    {
        mnodrivecalendaritem *modelplates = [mnodrivecalendaritemforeigner plates];
        mnodrivecalendaritem *modelmornings = [mnodrivecalendaritemforeigner mornings];
        mnodrivecalendaritem *modelsaturdays = [mnodrivecalendaritemforeigner saturdays];
        
        [items addObject:modelplates];
        [items addObject:modelmornings];
        [items addObject:modelsaturdays];
    }
    
    mnodrivecalendarsectionforeigner *model = [[mnodrivecalendarsectionforeigner alloc] init:name items:items];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.reusableidentifier = [vnodrivecalendarcellforeigner reusableidentifier];
    self.cellclass = [vnodrivecalendarcellforeigner class];
    self.cellheight = nodrivecalendarforeignerheight;
    
    return self;
}

@end