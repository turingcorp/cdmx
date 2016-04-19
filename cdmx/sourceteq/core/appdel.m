#import "appdel.h"
#import "updater.h"
#import "cmain.h"
#import "notificationspollution.h"

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
    [app scheduleLocalNotification:[[notificationspollution alloc] init]];
}

-(void)applicationWillTerminate:(UIApplication*)app
{
    [app scheduleLocalNotification:[[notificationspollution alloc] init]];
}

-(void)applicationDidBecomeActive:(UIApplication*)app
{
    [app cancelAllLocalNotifications];
}

@end