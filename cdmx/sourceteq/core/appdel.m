#import "appdel.h"
#import "updater.h"
#import "cmain.h"
#import "snotpollution.h"
#import "msettings.h"

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
    
    if([msettings singleton].notifications)
    {
        UILocalNotification *notification = [snotpollution notification];
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

@end