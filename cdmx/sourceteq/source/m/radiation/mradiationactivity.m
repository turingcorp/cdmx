#import "mradiationactivity.h"
#import "mradiationactivityexercise.h"
#import "mradiationactivitytransport.h"
#import "mradiationactivityoutdoors.h"
#import "mradiationactivitycafe.h"

@interface mradiationactivity ()

@property(copy, nonatomic, readwrite)NSString *asset;
@property(copy, nonatomic, readwrite)NSString *name;
@property(assign, nonatomic, readwrite)BOOL allowed;

@end

@implementation mradiationactivity

+(instancetype)exercise:(BOOL)allowed
{
    mradiationactivityexercise *model = [[mradiationactivityexercise alloc] init:allowed];
    
    return model;
}

+(instancetype)transport:(BOOL)allowed
{
    mradiationactivitytransport *model = [[mradiationactivitytransport alloc] init:allowed];
    
    return model;
}

+(instancetype)outdoors:(BOOL)allowed
{
    mradiationactivityoutdoors *model = [[mradiationactivityoutdoors alloc] init:allowed];
    
    return model;
}

+(instancetype)cafe:(BOOL)allowed
{
    mradiationactivitycafe *model = [[mradiationactivitycafe alloc] init:allowed];
    
    return model;
}

-(instancetype)init:(BOOL)allowed
{
    self = [self init];
    self.allowed = allowed;
    
    return self;
}

@end