#import "mstations.h"
#import "mdb.h"
#import "mdbcreate.h"

@implementation mstations

+(instancetype)singleton
{
    static mstations *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)load
{
    self.items = [NSMutableArray array];
    
    NSArray *rawstations = [mdb loadstations];
    NSUInteger count = rawstations.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawstation = rawstations[i];
        NSInteger rawid = [rawstation[@"id"] integerValue];
        NSString *rawstationid = rawstation[@"stationid"];
        NSInteger rawlatitude = [rawstation[@"latitude"] integerValue];
        NSInteger rawlongitude = [rawstation[@"longitude"] integerValue];
        NSInteger rawaltitude = [rawstation[@"altitude"] integerValue];
        NSString *rawshortname = rawstation[@"shortname"];
        NSString *rawname = rawstation[@"name"];
        NSString *rawmessage = rawstation[@"message"];
        CGFloat coordlatitude = rawlatitude * coordinatesmult;
        CGFloat coordlongitude = rawlongitude * coordinatesmult;
        
        mstationsitem *item = [[mstationsitem alloc] init];
        item.stationid = rawid;
        item.sid = rawstationid;
        item.latitude = coordlatitude;
        item.longitiude = coordlongitude;
        item.altitude = rawaltitude;
        item.shortname = rawshortname;
        item.name = rawname;
        item.message = rawmessage;
        
        [self.items addObject:item];
    }
}

@end