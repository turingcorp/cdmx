#import "mnodrivetodayitemhologram.h"
#import "mnodriverating.h"

@interface mnodrivetodayitemhologram ()

@property(copy, nonatomic, readwrite)NSString *symbol;

@end

@implementation mnodrivetodayitemhologram

-(instancetype)init:(mnodriverating*)rating
{
    self = [super init];
    self.symbol = rating.name;
    
    return self;
}

@end