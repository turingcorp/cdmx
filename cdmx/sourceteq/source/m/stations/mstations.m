#import "mstations.h"
#import "mdb.h"

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
    self.loaded = NO;
    
    return self;
}

#pragma mark public

-(void)load
{
    self.items = [mdb loadstations];
}

@end