#import "mnodrivecalendaritemforeigner.h"
#import "mnodrivecalendaritemforeignersame.h"
#import "mnodrivecalendaritemforeignerplates.h"
#import "mnodrivecalendaritemforeignermornings.h"
#import "mnodrivecalendaritemforeignersaturdays.h"

@interface mnodrivecalendaritemforeigner ()

@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mnodrivecalendaritemforeigner

+(instancetype)same
{
    mnodrivecalendaritemforeigner *model = [[mnodrivecalendaritemforeignersame alloc] init];
    
    return model;
}

+(instancetype)plates
{
    mnodrivecalendaritemforeigner *model = [[mnodrivecalendaritemforeignerplates alloc] init];
    
    return model;
}

+(instancetype)mornings
{
    mnodrivecalendaritemforeigner *model = [[mnodrivecalendaritemforeignermornings alloc] init];
    
    return model;
}

+(instancetype)saturdays
{
    mnodrivecalendaritemforeigner *model = [[mnodrivecalendaritemforeignersaturdays alloc] init];
    
    return model;
}

@end