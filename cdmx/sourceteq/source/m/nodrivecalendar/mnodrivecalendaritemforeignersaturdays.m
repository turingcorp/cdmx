#import "mnodrivecalendaritemforeignersaturdays.h"

@interface mnodrivecalendaritemforeigner ()

@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivecalendaritemforeignersaturdays

-(instancetype)init
{
    self = [super init];
    self.info = NSLocalizedString(@"mnodrive_calendar_foreigner_saturdays", nil);
    
    return self;
}

@end