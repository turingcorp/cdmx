#import "mnodrivetoday.h"
#import "mnodrive.h"

@interface mnodrivetoday ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivetodaysection*> *sections;

@end

@implementation mnodrivetoday

+(instancetype)model:(mnodrive*)model
{
    NSMutableArray<mnodrivetodaysection*> *sections = [NSMutableArray array];
    
    mnodrivetoday *today = [[mnodrivetoday alloc] init:sections];
    
    return today;
}

-(instancetype)init:(NSArray<mnodrivetodaysection*>*)sections
{
    self = [super init];
    self.sections = sections;
    
    return self;
}

@end