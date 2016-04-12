#import "appdel.h"

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
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:[mstore singleton]];
    
    return YES;
}

@end