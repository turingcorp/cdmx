#import "appdel.h"
#import "analytics.h"
#import "updater.h"
#import "cmain.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    [[analytics singleton] start];
    
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    [window setBackgroundColor:[UIColor blackColor]];
    [window setRootViewController:[cmain singleton]];

    [updater launch];
    
    return YES;
}

@end