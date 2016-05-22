#import "mnodrivetodaysectionplate.h"
#import "mnodrivetodayitemplate.h"

@interface mnodrivetodayitemplate ()

-(instancetype)init:(mnodriveitemplate*)plate;

@end

@interface mnodrivetodaysection ()

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items;

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

@end