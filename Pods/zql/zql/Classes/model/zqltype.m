#import "zqltype.h"
#import "zqltypeinteger.h"
#import "zqltypetext.h"

@implementation zqltype

+(instancetype)integer
{
    zqltypeinteger *type = [[zqltypeinteger alloc] init];
    
    return type;
}

+(instancetype)text
{
    zqltypetext *type = [[zqltypetext alloc] init];
    
    return type;
}

@end