#import "mnodrivetodaysectionfree.h"

@interface mnodrivetodaysection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items;

@property(assign, nonatomic, readwrite)BOOL headerborder;

@end

@implementation mnodrivetodaysectionfree

+(instancetype)model
{
    NSString *name = NSLocalizedString(@"mnodrive_today_section_free", nil);
    
    mnodrivetodaysectionfree *model = [[mnodrivetodaysectionfree alloc] init:name items:nil];
    
    return model;
}

-(instancetype)init
{
    self = [super init];
    self.headerborder = NO;
    
    return self;
}

@end