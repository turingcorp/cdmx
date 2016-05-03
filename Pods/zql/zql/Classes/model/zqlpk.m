#import "zqlpk.h"

static NSString* const zqlprimarykeyname = @"id";

@implementation zqlpk

+(instancetype)primarykey
{
    zqltype *type = [zqltype integer];
    zqlpk *pk = [zqlpk type:type name:zqlprimarykeyname value:nil];
    
    return pk;
}

@end