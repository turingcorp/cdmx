#import "mstations.h"
#import "mdb.h"
#import "mdbcreate.h"

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
    
    return self;
}

#pragma mark public

-(void)load
{
    self.items = [mdb loadstations];
    
}

@end