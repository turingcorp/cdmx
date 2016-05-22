#import "mnodrivetodaysection.h"
#import "mnodrivetodaysectionfree.h"
#import "mnodrivetodaysectionplate.h"
#import "mnodrivetodaysectionhologram.h"
#import "mnodrivetodaysectionrestriction.h"

@interface mnodrivetodaysectionfree ()

+(instancetype)model;

@end

@interface mnodrivetodaysectionplate ()

+(instancetype)model:(NSArray<mnodriveitemplate*>*)plates;

@end

@interface mnodrivetodaysectionhologram ()

+(instancetype)model:(NSArray<mnodriverating*>*)ratings;

@end

@interface mnodrivetodaysection ()

@property(strong, nonatomic, readwrite)NSArray<mnodrivetodayitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellwidth;
@property(assign, nonatomic, readwrite)NSInteger cellheight;
@property(assign, nonatomic, readwrite)NSInteger cellsperrow;
@property(assign, nonatomic, readwrite)BOOL fullwidth;
@property(assign, nonatomic, readwrite)BOOL headerborder;

@end

@implementation mnodrivetodaysection

+(instancetype)free
{
    mnodrivetodaysection *model = [mnodrivetodaysectionfree model];
    
    return model;
}

+(instancetype)plates:(NSArray<mnodriveitemplate*>*)plates
{
    mnodrivetodaysection *model = [mnodrivetodaysectionplate model:plates];
    
    return model;
}

+(instancetype)holograms:(NSArray<mnodriverating*>*)ratings
{
    mnodrivetodaysectionhologram *model = [mnodrivetodaysectionhologram model:ratings];
    
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