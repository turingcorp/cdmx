#import "vnodrivecalendar.h"
#import "cnodrivecalendar.h"

@interface vnodrivecalendar ()

@property(strong, nonatomic, readwrite)mnodrivecalendar *model;

@end

@implementation vnodrivecalendar

-(instancetype)init:(cnodrivecalendar*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vnodrive_calendar_title", nil)];
    
    return self;
}

#pragma mark public

-(void)modelcalendar:(mnodrivecalendar*)model
{
    self.model = model;
    [self.collection reloadData];
}

@end