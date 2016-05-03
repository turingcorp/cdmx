#import "zqltypeinteger.h"

static NSString* const zqltypeintegername = @"integer";

@implementation zqltypeinteger

-(instancetype)init
{
    self = [super init];
    self.name = zqltypeintegername;
    
    return self;
}

@end