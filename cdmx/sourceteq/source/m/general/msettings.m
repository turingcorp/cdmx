#import "msettings.h"

@implementation msettings

+(instancetype)singleton
{
    static msettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults valueForKey:@"settings"];
    
    if(settings)
    {
        self.starsrated = [settings[@"starsrated"] unsignedIntegerValue];
    }
    else
    {
        self.starsrated = 0;
    }
    
    if(!settings)
    {
        [self save];
    }
    
    return self;
}

#pragma mark functionality

#pragma mark public

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    settings[@"starsrated"] = @(self.starsrated);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:settings forKey:@"settings"];
}

@end