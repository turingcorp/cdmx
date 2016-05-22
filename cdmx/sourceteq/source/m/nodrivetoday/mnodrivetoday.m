#import "mnodrivetoday.h"
#import "mnodrive.h"

@interface mnodrivetodaysection ()

+(instancetype)free;
+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates;
+(instancetype)holograms:(NSArray<mnodriverating*>*)ratings;

@end

@interface mnodrivetoday ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivetodaysection*> *sections;

@end

@implementation mnodrivetoday

+(instancetype)model:(mnodrive*)model
{
    NSMutableArray<mnodrivetodaysection*> *sections = [NSMutableArray array];
    NSArray<mnodriveitemplate*> *plates = model.today.plates;
    
    if(plates.count)
    {
        mnodrivetodaysection *sectionplates = [mnodrivetodaysection plates:plates];
        mnodrivetodaysection *sectionholograms = [mnodrivetodaysection holograms:model.ratings];
        
        [sections addObject:sectionplates];
        [sections addObject:sectionholograms];
    }
    else
    {
        mnodrivetodaysection *sectionfree = [mnodrivetodaysection free];
        
        [sections addObject:sectionfree];
    }
    
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