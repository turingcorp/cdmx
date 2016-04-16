#import "mstations.h"
#import "mdb.h"
#import "amanager.h"
#import "acallstations.h"
#import "nsnotification+nsnotificationmain.h"

@implementation mstations

+(instancetype)singleton
{
    static mstations *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    self.readings = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)fetch
{
    [amanager call:[[acallstations alloc] init] delegate:self];
}

-(void)load
{
    self.items = [mdb loadstations];
    [self fetch];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    self.error = nil;
    [NSNotification stationsloaded];
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    self.error = error;
    [NSNotification stationsloaded];
}

@end