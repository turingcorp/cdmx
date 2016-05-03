#import "updater.h"
#import "msettings.h"
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
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    NSString *appversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:appversion_key];
    NSString *currentversion = [userdefaults valueForKey:appversion_key];
    
    if(currentversion)
    {
        CGFloat appversionscalar = appversion.floatValue;
        CGFloat currentversionscalar = currentversion.floatValue;
        
        if(appversionscalar != currentversionscalar)
        {
            [userdefaults setValue:appversion forKey:appversion_key];
            [updater updateversion];
        }
    }
    else
    {
        [updater firsttime];
    }
}

+(void)firsttime
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    [userdefaults removePersistentDomainForName:NSGlobalDomain];
    [userdefaults removePersistentDomainForName:NSArgumentDomain];
    [userdefaults removePersistentDomainForName:NSRegistrationDomain];
    [userdefaults synchronize];
}

+(void)updateversion
{
    
}

@end