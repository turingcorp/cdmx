#import "mpollutionreaditem.h"
#import "mpollutionreaditemdist.h"
#import "mpollutionreaditemglobal.h"

@implementation mpollutionreaditem

+(instancetype)dist:(mpollutiondistitem*)dist
{
    mpollutionreaditemdist *item = [[mpollutionreaditemdist alloc] init];
    
    return item;
}

+(instancetype)global
{
    mpollutionreaditemglobal *item = [[mpollutionreaditemglobal alloc] init];
    
    return item;
}

@end