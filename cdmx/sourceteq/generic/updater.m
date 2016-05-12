#import "updater.h"
#import "msettings.h"
#import "analytics.h"
#import "cmain.h"
#import "genericconstants.h"
#import "mdbcreate.h"

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
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSString *appversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:appversionos_key];
    NSString *currentversion = [userdefaults valueForKey:appversion_key];
    BOOL updateversion = NO;
    
    if(currentversion)
    {
        CGFloat appversionscalar = appversion.floatValue;
        CGFloat currentversionscalar = currentversion.floatValue;
        
        if(appversionscalar != currentversionscalar)
        {
            updateversion = YES;
        }
        
        [mdbcreate loaddatabase];
    }
    else
    {
        updateversion = YES;
        [updater firsttime];
    }
    
    if(updateversion)
    {
        [userdefaults setValue:appversion forKey:appversion_key];
    }
}

+(void)firsttime
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    [userdefaults removePersistentDomainForName:NSGlobalDomain];
    [userdefaults removePersistentDomainForName:NSArgumentDomain];
    [userdefaults removePersistentDomainForName:NSRegistrationDomain];
    [userdefaults synchronize];
    
    [mdbcreate firsttime];
}

@end