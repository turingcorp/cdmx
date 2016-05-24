#import "mnodrivecalendaritemforeignersame.h"

@interface mnodrivecalendaritemforeigner ()

@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivecalendaritemforeignersame

-(instancetype)init
{
    self = [super init];
    self.info = NSLocalizedString(@"mnodrive_calendar_foreigner_same", nil);
    
    return self;
}

@end