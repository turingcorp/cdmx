#import "zqlresultparams.h"

@interface zqlresultparams ()

@property(strong, nonatomic, readwrite)NSMutableDictionary<NSString*, zqlparam*> *items;

@end

@implementation zqlresultparams

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableDictionary dictionary];
    
    return self;
}

-(NSString*)description
{
    NSString *descr = [NSString stringWithFormat:@"%@", self.items];
    
    return descr;
}

#pragma mark public

-(void)add:(zqlparam*)param
{
    self.items[param.name] = param;
}

@end