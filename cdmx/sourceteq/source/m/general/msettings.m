#import "msettings.h"

static NSString* const key_settings = @"settings";
static NSString* const key_notifications = @"notifications";

@implementation msettings

+(instancetype)singleton
{
    static msettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark functionality

#pragma mark public

-(void)load
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults valueForKey:key_settings];
    
    if(settings)
    {
        self.notifications = [settings[key_notifications] boolValue];
    }
    else
    {
        self.notifications = YES;
    }
    
    if(!settings)
    {
        [self save];
    }
}

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[key_notifications] = @(self.notifications);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:key_settings];
}

@end