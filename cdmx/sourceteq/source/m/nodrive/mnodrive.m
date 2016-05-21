#import "mnodrive.h"

@interface mnodriveitem ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mnodrive ()

@property(strong, nonatomic, readwrite)mnodriveitem *today;
@property(strong, nonatomic, readwrite)NSArray<mnodriveitem*> *week;
@property(strong, nonatomic, readwrite)NSArray<mnodriveitem*> *staturdays;

@end

@implementation mnodrive

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSDictionary *rawtoday = dictionary[@"today"];
    NSArray *rawweek = dictionary[@"week"];
    NSArray *rawsaturdays = dictionary[@"saturdays"];
    
    self.today = [[mnodriveitem alloc] init:rawtoday];
    
    NSMutableArray<mnodriveitem*> *week = [NSMutableArray array];
    NSUInteger countweek = rawweek.count;
    
    for(NSUInteger indexweek = 0; indexweek < countweek; indexweek++)
    {
        NSDictionary *rawweekitem = rawweek[indexweek];
        mnodriveitem *weekitem = [[mnodriveitem alloc] init:rawweekitem];
        
        [week addObject:weekitem];
    }
    
    self.week = week;
    
    NSMutableArray<mnodriveitem*> *saturdays = [NSMutableArray array];
    NSUInteger countsaturdays = rawsaturdays.count;
    
    for(NSUInteger indexsaturdays = 0; indexsaturdays < countsaturdays; indexsaturdays++)
    {
        NSDictionary *rawsaturdayitem = rawsaturdays[indexsaturdays];
        mnodriveitem *saturdayitem = [[mnodriveitem alloc] init:rawsaturdayitem];
        
        [week addObject:saturdayitem];
    }
    
    self.staturdays = saturdays;
    
    return self;
}

@end