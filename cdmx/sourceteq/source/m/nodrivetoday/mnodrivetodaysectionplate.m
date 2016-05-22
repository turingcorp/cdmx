#import "mnodrivetodaysectionplate.h"
#import "mnodrivetodayitemplate.h"
#import "vnodrivecellplate.h"
#import "ecollectioncell.h"

static NSInteger const nodrivetodayplatewidth = 70;
static NSInteger const nodrivetodayplateheight = 70;
static NSInteger const nodrivetodayplatecellsperrow = 2;

@interface mnodrivetodayitemplate ()

-(instancetype)init:(mnodriveitemplate*)plate;

@end

@interface mnodrivetodaysection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items;

@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellwidth;
@property(assign, nonatomic, readwrite)NSInteger cellheight;
@property(assign, nonatomic, readwrite)NSInteger cellsperrow;
@property(assign, nonatomic, readwrite)BOOL fullwidth;

@end

@implementation mnodrivetodaysectionplate

+(instancetype)model:(NSArray<mnodriveitemplate*>*)plates
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
    
    return self;
}

@end