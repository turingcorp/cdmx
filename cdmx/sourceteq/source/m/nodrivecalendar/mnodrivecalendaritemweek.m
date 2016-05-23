#import "mnodrivecalendaritemweek.h"
#import "mnodriveitemplate.h"

@interface mnodrivecalendaritemweek ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *day;
@property(copy, nonatomic, readwrite)NSString *numbera;
@property(copy, nonatomic, readwrite)NSString *numberb;
@property(assign, nonatomic, readwrite)BOOL permit;

@end

@implementation mnodrivecalendaritemweek

-(instancetype)init:(NSInteger)day platea:(mnodriveitemplate*)platea plateb:(mnodriveitemplate*)plateb permit:(BOOL)permit
{
    self = [super init];
    NSString *dayname = [NSString stringWithFormat:@"mnodrive_calendar_item_week_%@", @(day)];
    self.day = NSLocalizedString(dayname, nil);
    self.numbera = platea.description;
    self.numberb = plateb.description;
    self.color = platea.color;
    self.permit = permit;
    
    return self;
}

@end