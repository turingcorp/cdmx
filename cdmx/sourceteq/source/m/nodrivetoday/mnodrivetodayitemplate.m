#import "mnodrivetodayitemplate.h"
#import "mnodriveitemplate.h"

static NSInteger const nodrivetodayplatewidth = 80;
static NSInteger const nodrivetodayplateheight = 80;

@interface mnodrivetodayitem ()

@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellwidth;
@property(assign, nonatomic, readwrite)NSInteger cellheight;
@property(assign, nonatomic, readwrite)BOOL fullwidth;

@end

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
    self.cellwidth = nodrivetodayplatewidth;
    self.cellheight = nodrivetodayplateheight;
    self.fullwidth = NO;
    
    return self;
}

@end