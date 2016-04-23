#import "updater.h"
#import "tools.h"
#import "msettings.h"
#import "mdb.h"
#import "db.h"
#import "analytics.h"
#import "cmain.h"
#import "mstations.h"

@implementation updater

NSString *documents;

+(void)launch
{
    [[analytics singleton] start];
    [updater update];
    [[msettings singleton] load];
    [updater registernotifications];
}

#pragma mark private

+(void)update
{
    documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSDictionary *defaults = [tools defaultdict];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version != 20)
        {
            [updater firsttime:defaults];
            [mdb updatedb];
        }
    }
    
    dbname = [documents stringByAppendingPathComponent:[properties valueForKey:@"dbname"]];
}

+(void)firsttime:(NSDictionary*)plist
{
    NSNumber *appid = plist[@"appid"];
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:@"appid"];
    [userdef synchronize];
}

+(void)registernotifications
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5), dispatch_get_main_queue(),
                   ^
                   {
                       if([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
                       {
                           UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil];
                           [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
                       }
                   });
}

@end