#import "zqlresultsuccess.h"

@interface zqlresultsuccess ()

@property(strong, nonatomic, readwrite)NSMutableArray<zqlresultparams*> *params;

@end

@implementation zqlresultsuccess

@dynamic params;

-(instancetype)init:(BOOL)moresteps
{
    self = [super init];
    self.success = YES;
    self.moresteps = moresteps;
    self.params = [NSMutableArray array];
    
    return self;
}

-(NSString*)description
{
    NSString *descr;
    
    if(self.params)
    {
        descr = [NSString stringWithFormat:@"%@", self.params];
    }
    else
    {
        descr = [NSString stringWithFormat:@"%@", @(self.success)];
    }
    
    return descr;
}

#pragma mark -
#pragma mark result

-(zqlresult*)merge:(zqlresult*)result
{
    zqlresult *newresult;
    
    if(result.success)
    {
        [self.params addObjectsFromArray:result.params];
        
        if(result.lastinsertid)
        {
            self.lastinsertid = result.lastinsertid;
        }
        
        self.moresteps = result.moresteps;
        newresult = self;
    }
    else
    {
        newresult = result;
    }
    
    return newresult;
}

@end