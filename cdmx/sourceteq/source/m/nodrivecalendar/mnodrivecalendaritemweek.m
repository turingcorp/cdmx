#import "mnodrivecalendaritemweek.h"
#import "mnodriveitemplate.h"

@interface mnodrivecalendaritemweek ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *day;
@property(copy, nonatomic, readwrite)NSString *numbera;
@property(copy, nonatomic, readwrite)NSString *numberb;

@end

@implementation mnodrivecalendaritemweek

-(instancetype)init:(NSInteger)day platea:(mnodriveitemplate*)platea plateb:(mnodriveitemplate*)plateb
{
    self = [super init];
    NSString *dayname = [NSString stringWithFormat:@"mnodrive_calendar_item_week_%@", @(day)];
    self.day = NSLocalizedString(dayname, nil);
    self.numbera = platea.description;
    self.numberb = plateb.description;
    self.color = platea.color;
    
    return self;
}

@end