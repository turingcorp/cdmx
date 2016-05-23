#import "mnodrive.h"

@interface mnodriveitem ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mnodrive ()

@property(strong, nonatomic, readwrite)mnodriveitem *today;
@property(strong, nonatomic, readwrite)NSArray<mnodriveitem*> *week;
@property(strong, nonatomic, readwrite)NSArray<mnodriverating*> *ratings;
@property(assign, nonatomic, readwrite)BOOL allstates;
@property(assign, nonatomic, readwrite)BOOL bikesrestricted;

@end

@implementation mnodrive

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    NSDictionary *rawtoday = dictionary[@"today"];
    NSArray *rawweek = dictionary[@"week"];
    NSDictionary *rawratings = dictionary[@"ratings"];
    NSNumber *rawratings00 = rawratings[@"rate00"];
    NSNumber *rawratings0 = rawratings[@"rate0"];
    NSNumber *rawratings1 = rawratings[@"rate1"];
    NSNumber *rawratings2 = rawratings[@"rate2"];
    NSNumber *rawallstates = dictionary[@"allstates"];
    NSNumber *rawbikesrestricted = dictionary[@"bikerestricted"];
    
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
    
    NSMutableArray<mnodriverating*> *ratings = [NSMutableArray array];
    
    if(rawratings00.boolValue)
    {
        mnodriverating *rating = [mnodriverating rate00];
        [ratings addObject:rating];
    }
    
    if(rawratings0.boolValue)
    {
        mnodriverating *rating = [mnodriverating rate0];
        [ratings addObject:rating];
    }
    
    if(rawratings1.boolValue)
    {
        mnodriverating *rating = [mnodriverating rate1];
        [ratings addObject:rating];
    }
    
    if(rawratings2.boolValue)
    {
        mnodriverating *rating = [mnodriverating rate2];
        [ratings addObject:rating];
    }
    
    self.ratings = ratings;
    self.allstates = rawallstates.boolValue;
    self.bikesrestricted = rawbikesrestricted.boolValue;
    
    return self;
}

#pragma mark public

-(mnodrivetoday*)modeltoday
{
    mnodrivetoday *today = [mnodrivetoday model:self];
    
    return today;
}

-(mnodrivecalendar*)modelcalendar
{
    mnodrivecalendar *calendar = [mnodrivecalendar model:self];
    
    return calendar;
}

@end