#import "mnodrivecalendaritemforeignermornings.h"

@interface mnodrivecalendaritemforeigner ()

@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivecalendaritemforeignermornings

-(instancetype)init
{
    self = [super init];
    self.info = NSLocalizedString(@"mnodrive_calendar_foreigner_mornings", nil);
    
    return self;
}

@end