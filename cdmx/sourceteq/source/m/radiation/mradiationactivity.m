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

+(instancetype)exercsise:(BOOL)allowed
{
    mradiationactivityexercise *model = [[mradiationactivityexercise alloc] init:allowed];
    
    return model;
}

+(instancetype)transport:(BOOL)allowed
{
    
}

+(instancetype)outdoors:(BOOL)allowed
{
    
}

+(instancetype)cafe:(BOOL)allowed
{
    
}

-(instancetype)init:(BOOL)allowed
{
    self = [super init];
    self.allowed = allowed;
    
    return self;
}

@end