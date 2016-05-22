#import "mnodrivetodaysectionrestriction.h"
#import "mnodrivetodayitemrestriction.h"
#import "vnodrivecellrestriction.h"
#import "ecollectioncell.h"

static NSInteger const nodrivetodayrestrictionheight = 60;

@interface mnodrivetodayitemrestriction ()

+(instancetype)time:(mnodrive*)model;

@end

@interface mnodrivetodaysection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items;

@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;
@property(assign, nonatomic, readwrite)BOOL fullwidth;
@property(assign, nonatomic, readwrite)BOOL headerborder;

@end

@implementation mnodrivetodaysectionrestriction

+(instancetype)model:(mnodrive*)nodrive
{
    NSString *name = NSLocalizedString(@"mnodrive_today_section_restriction", nil);
    NSMutableArray<mnodrivetodayitemrestriction*> *items = [NSMutableArray array];
    
    mnodrivetodayitemrestriction *restrictiontime = [mnodrivetodayitemrestriction time:nodrive];
    
    [items addObject:restrictiontime];
    
    mnodrivetodaysectionrestriction *model = [[mnodrivetodaysectionrestriction alloc] init:name items:items];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.reusableidentifier = [vnodrivecellrestriction reusableidentifier];
    self.cellclass = [vnodrivecellrestriction class];
    self.cellheight = nodrivetodayrestrictionheight;
    self.fullwidth = YES;
    self.headerborder = YES;
    
    return self;
}

@end