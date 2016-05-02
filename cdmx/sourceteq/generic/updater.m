#import "updater.h"
#import "msettings.h"
#import "mdb.h"
#import "db.h"
#import "analytics.h"
#import "cmain.h"
#import "genericconstants.h"

@implementation updater

+(void)launch
{
    [[analytics singleton] start];
    [updater update];
    [[msettings singleton] load];
}

#pragma mark private

+(void)update
{
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSDictionary *defaults = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"def" withExtension:@"plist"]];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version < 10)
        {
            [updater firsttime:defaults];
        }
        
        [mdb updatedb];
    }
    
    dbname = [documents stringByAppendingPathComponent:[properties valueForKey:@"dbname"]];
}

+(void)firsttime:(NSDictionary*)plist
{
    NSNumber *appid = plist[appid_key];
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:appid_key];
    [userdef synchronize];
}

@end