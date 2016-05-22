#import "mnodrivetodaysection.h"

@interface mnodrivetodaysection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodrivetodaysection

+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates
{
    
}

-(instancetype)init:(NSString*)name items:(NSArray<mnodrivetodayitem*>*)items
{
    self = [super init];
    
    return self;
}

@end