#import "mnodrivetodayitemplate.h"
#import "mnodriveitemplate.h"

@interface mnodrivetodayitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *number;

@end

@implementation mnodrivetodayitemplate

-(instancetype)init:(mnodriveitemplate*)plate
{
    self = [super init];
    self.color = plate.color;
    self.number = [NSString stringWithFormat:@"%@", @(plate.number)];
    
    return self;
}

@end