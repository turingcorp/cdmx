#import "zqltypetext.h"

static NSString* const zqltypetextname = @"text";

@implementation zqltypetext

-(instancetype)init
{
    self = [super init];
    self.name = zqltypetextname;
    
    return self;
}

@end