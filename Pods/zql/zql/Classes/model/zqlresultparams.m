#import "zqlresultparams.h"

@interface zqlresultparams ()

@property(strong, nonatomic, readwrite)NSDictionary<NSString*, zqlparam*> *items;

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
    NSMutableDictionary<NSString*, zqlparam*> *items = self.items.mutableCopy;
    items[param.name] = param;
    self.items = items;
}

@end