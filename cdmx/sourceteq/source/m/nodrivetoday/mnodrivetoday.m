#import "mnodrivetoday.h"
#import "mnodrive.h"

@interface mnodrivetodaysection ()

+(instancetype)free;
+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates;
+(instancetype)holograms:(NSArray<mnodriverating*>*)ratings;
+(instancetype)restrictions:(mnodrive*)nodrive;

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
        mnodrivetodaysection *sectionrestrictions = [mnodrivetodaysection restrictions:model];
        
        [sections addObject:sectionplates];
        [sections addObject:sectionholograms];
        [sections addObject:sectionrestrictions];
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