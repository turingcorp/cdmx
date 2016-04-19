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
    [self pollutionnotification];
}

-(void)applicationWillTerminate:(UIApplication*)app
{
    [self pollutionnotification];
}

-(void)applicationDidBecomeActive:(UIApplication*)app
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

#pragma mark functionality

-(void)pollutionnotification
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    [notification setAlertBody:NSLocalizedString(@"notification_pollution", nil)];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end