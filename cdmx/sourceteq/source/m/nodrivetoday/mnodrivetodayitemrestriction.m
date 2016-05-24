#import "mnodrivetodayitemrestriction.h"
#import "mnodrivetodayitemrestrictiontime.h"
#import "mnodrivetodayitemrestrictionforeigner.h"
#import "mnodrivetodayitemrestrictionbike.h"
#import "mnodrivetodayitemrestrictionpermit.h"
#import "mnodrivetodayitemrestrictiontourist.h"

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

+(instancetype)bike:(mnodrive*)model
{
    mnodrivetodayitemrestriction *restriction = [[mnodrivetodayitemrestrictionbike alloc] init:model];
    
    return restriction;
}

+(instancetype)permit:(mnodrive*)model
{
    mnodrivetodayitemrestriction *restriction = [[mnodrivetodayitemrestrictionpermit alloc] init:model];
    
    return restriction;
}

+(instancetype)tourist:(mnodrive*)model
{
    mnodrivetodayitemrestriction *restriction = [[mnodrivetodayitemrestrictiontourist alloc] init:model];
    
    return restriction;
}

-(instancetype)init:(mnodrive*)model
{
    self = [super init];
    
    return self;
}

@end