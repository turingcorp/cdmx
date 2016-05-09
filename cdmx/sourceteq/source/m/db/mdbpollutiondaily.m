#import "mdbpollutiondaily.h"

@implementation mdbpollutiondaily

+(instancetype)empty
{
    mdbpollutiondaily *model = [[mdbpollutiondaily alloc] init];
    model.primarykey = @0;
    model.created = @0;
    model.date = @0;
    model.pollution = @0;
    
    return model;
}

@end