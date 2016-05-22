#import "mnodrivetodaysection.h"
#import "mnodrivetodaysectionplate.h"
#import "mnodrivetodaysectionhologram.h"
#import "mnodrivetodaysectionrestriction.h"

@interface mnodrivetodaysectionplate ()

+(instancetype)model:(NSArray<mnodriveitemplate*>*)plates;

@end

@interface mnodrivetodaysection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodrivetodaysection

+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates
{
    mnodrivetodaysection *model = [mnodrivetodaysectionplate model:plates];
    
    return model;
}

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items
{
    self = [self init];
    self.name = name;
    self.items = items;
    
    return self;
}

@end