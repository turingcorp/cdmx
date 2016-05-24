#import "mnodrivecalendaritemforeignerplates.h"

@interface mnodrivecalendaritemforeigner ()

@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivecalendaritemforeignerplates

-(instancetype)init
{
    self = [super init];
    self.info = NSLocalizedString(@"mnodrive_calendar_foreigner_plates", nil);
    
    return self;
}

@end