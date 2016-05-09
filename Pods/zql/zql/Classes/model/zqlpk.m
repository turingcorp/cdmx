#import "zqlpk.h"

static NSString* const zqlprimarykeyname = @"id";
static NSString* const zqlparamcreatestringpk = @"id INTEGER PRIMARY KEY";

@implementation zqlpk

+(instancetype)primarykey
{
    zqlpk *pk = [[zqlpk alloc] init];
    
    return pk;
}

-(instancetype)init
{
    self = [super init];
    self.type = [zqltype integer];
    self.name = zqlprimarykeyname;
    
    return self;
}

#pragma mark -
#pragma mark param

-(NSString*)querycreate
{
    return zqlparamcreatestringpk;
}

@end