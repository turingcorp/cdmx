#import "mradiation.h"
#import "mradiationnone.h"
#import "mradiationlow.h"
#import "mradiationmid.h"
#import "mradiationhigh.h"
#import "mradiationveryhigh.h"
#import "mradiationextreme.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;
@property(assign, nonatomic, readwrite)NSInteger points;

@end

@implementation mradiation

+(instancetype)points:(NSInteger)points
{
    mradiation *model;
    
    if(points < 1)
    {
        model = [[mradiationnone alloc] init:points];
    }
    else if(points < 3)
    {
        model = [[mradiationlow alloc] init:points];
    }
    else if(points < 6)
    {
        model = [[mradiationmid alloc] init:points];
    }
    else if(points < 8)
    {
        model = [[mradiationhigh alloc] init:points];
    }
    else if(points < 11)
    {
        model = [[mradiationveryhigh alloc] init:points];
    }
    else
    {
        model = [[mradiationextreme alloc] init:points];
    }
    
    return model;
}

-(instancetype)init:(NSInteger)points
{
    self = [self init];
    self.points = points;
    
    return self;
}

-(NSString*)description
{
    NSString *string = [NSString stringWithFormat:@"%@", @(self.points)];
    
    return string;
}

@end