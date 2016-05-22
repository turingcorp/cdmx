#import "mnodrivetodayitemrestriction.h"
#import "mnodrivetodayitemrestrictiontime.h"
#import "mnodrivetodayitemrestrictionforeigner.h"

@interface mnodrivetodayitemrestriction ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *title;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivetodayitemrestriction

+(instancetype)time:(mnodrive*)model
{
    mnodrivetodayitemrestriction *restriction = [[mnodrivetodayitemrestrictiontime alloc] init:model];
    
    return restriction;
}

+(instancetype)foreigner:(mnodrive*)model
{
    mnodrivetodayitemrestriction *restriction = [[mnodrivetodayitemrestrictionforeigner alloc] init:model];
    
    return restriction;
}

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    return self;
}

@end