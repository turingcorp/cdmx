#import "mpollutionpollutant.h"

static NSString* const pollutantlocalizedname = @"mpollution_pollutant_name_%@";

@implementation mpollutionpollutant

+(instancetype)server:(NSNumber*)serverid
{
    mpollutionpollutant *model = [[mpollutionpollutant alloc] init:serverid];
    
    return model;
}

-(instancetype)init:(NSNumber*)serverid
{
    self = [super init];
    self.serverid = serverid;
    
    NSString *pollutantname = [NSString stringWithFormat:pollutantlocalizedname, serverid];
    self.name = NSLocalizedString(pollutantname, nil);
    
    return self;
}

@end