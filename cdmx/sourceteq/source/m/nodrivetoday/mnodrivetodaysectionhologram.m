#import "mnodrivetodaysectionhologram.h"
#import "mnodrivetodayitemhologram.h"
#import "vnodrivecellhologram.h"
#import "ecollectioncell.h"

static NSInteger const nodrivetodayhologramwidth = 55;
static NSInteger const nodrivetodayhologramheight = 55;
static NSInteger const nodrivetodayhologramcellsperrow = 2;

@interface mnodrivetodayitemhologram ()

-(instancetype)init:(mnodriverating*)rating;

@end

@interface mnodrivetodaysection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items;

@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellwidth;
@property(assign, nonatomic, readwrite)NSInteger cellheight;
@property(assign, nonatomic, readwrite)NSInteger cellsperrow;
@property(assign, nonatomic, readwrite)BOOL fullwidth;
@property(assign, nonatomic, readwrite)BOOL headerborder;

@end

@implementation mnodrivetodaysectionhologram

+(instancetype)model:(NSArray<mnodriverating*>*)ratings
{
    NSString *name = NSLocalizedString(@"mnodrive_today_section_hologram", nil);
    NSMutableArray<mnodrivetodayitemhologram*> *items = [NSMutableArray array];
    NSUInteger countratings = ratings.count;
    
    for(NSUInteger indexrating = 0; indexrating < countratings; indexrating++)
    {
        mnodriverating *rating = ratings[indexrating];
        mnodrivetodayitemhologram *modelhologram = [[mnodrivetodayitemhologram alloc] init:rating];
        [items addObject:modelhologram];
    }
    
    mnodrivetodaysectionhologram *model = [[mnodrivetodaysectionhologram alloc] init:name items:items];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.reusableidentifier = [vnodrivecellhologram reusableidentifier];
    self.cellclass = [vnodrivecellhologram class];
    self.cellwidth = nodrivetodayhologramwidth;
    self.cellheight = nodrivetodayhologramheight;
    self.cellsperrow = nodrivetodayhologramcellsperrow;
    self.fullwidth = NO;
    self.headerborder = YES;
    
    return self;
}

@end