#import "zqlresultsuccess.h"

@interface zqlresult ()

@property(strong, nonatomic, readwrite)NSArray<zqlresultparams*> *params;

@end

@implementation zqlresultsuccess

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
    
    if(self.params.count)
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
        NSMutableArray<zqlresultparams*> *params = [NSMutableArray array];
        [params addObjectsFromArray:self.params];
        [params addObjectsFromArray:result.params];
        self.params = params;
        
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