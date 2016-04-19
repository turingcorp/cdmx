#import "appdel.h"
#import "updater.h"
#import "cmain.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    [window setBackgroundColor:[UIColor whiteColor]];
    [window setRootViewController:[cmain singleton]];

    [updater launch];
    
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication*)app
{
    
}

-(void)applicationWillTerminate:(UIApplication*)app
{
    [app scheduleLocalNotification:];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    notification.alertBody = @"24 hours passed since last visit :(";
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end