#import "analytics.h"
#import "genericconstants.h"

static NSInteger const analyticsrate = 30;

@implementation analytics

+(instancetype)singleton
{
    static analytics *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark public

-(void)start
{
    self.tracker = [[GAI sharedInstance] trackerWithTrackingId:analyticsid];
    [[GAI sharedInstance] setTrackUncaughtExceptions:YES];
    [[GAI sharedInstance] setDispatchInterval:analyticsrate];
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelNone];
    
#if DEBUG
    
    [[GAI sharedInstance] setDryRun:YES];
//    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
    
#endif
    
}

-(void)trackscreen:(UIViewController*)controller
{
    NSString *screenname = NSStringFromClass(controller.class);
    [self.tracker send:[[[GAIDictionaryBuilder createScreenView] set:screenname forKey:kGAIScreenName] build]];
}

-(void)trackevent:(UIViewController*)controller action:(NSString*)action label:(NSString*)label
{
    NSString *screenname = NSStringFromClass(controller.class);
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:screenname action:action label:label value:@(1)] build]];
}

@end