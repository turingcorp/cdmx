#import "zqlpk.h"

static NSString* const zqlprimarykeyname = @"id";
static NSString* const zqlparamcreatestringpk = @"id INTEGER PRIMARY KEY";

@implementation zqlpk

+(instancetype)primarykey
{
    zqltype *type = [zqltype integer];
    zqlpk *pk = [zqlpk type:type name:zqlprimarykeyname value:nil];
    
    return pk;
}

#pragma mark -
#pragma mark param

-(NSString*)querycreate
{
    return zqlparamcreatestringpk;
}

@end