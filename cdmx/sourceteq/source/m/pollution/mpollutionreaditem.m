#import "mpollutionreaditem.h"
#import "mpollutionreaditemdist.h"
#import "mpollutionreaditemglobal.h"

@implementation mpollutionreaditem

+(instancetype)dist:(mpollutiondistitem*)dist index:(mpollutionindex*)index
{
    mpollutionreaditemdist *item = [[mpollutionreaditemdist alloc] init:dist index:index];
    
    return item;
}

+(instancetype)global:(mpollutionindex*)index
{
    mpollutionreaditemglobal *item = [[mpollutionreaditemglobal alloc] init];
    
    return item;
}

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.index = index;
    
    return self;
}

@end