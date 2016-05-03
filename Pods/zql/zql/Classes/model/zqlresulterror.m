#import "zqlresulterror.h"

@interface zqlresulterror ()

@property(copy, nonatomic)NSString *errordescr;

@end

@implementation zqlresulterror

-(instancetype)init:(NSString*)errordescr
{
    self = [super init];
    self.errordescr = errordescr;
    
    return self;
}

-(NSString*)description
{
    return self.errordescr;
}

@end