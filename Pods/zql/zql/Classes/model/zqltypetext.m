#import "zqltypetext.h"

static NSString* const zqltypetextname = @"text";
static NSString* const zqltypetextcreate = @"TEXT COLLATE NOCASE";

@implementation zqltypetext

-(instancetype)init
{
    self = [super init];
    self.name = zqltypetextname;
    
    return self;
}

#pragma mark -
#pragma mark type

-(NSString*)queryvalue:(id)value
{
    NSString *string = [NSString stringWithFormat:@"\"%@\"", value];
    
    return string;
}

-(NSString*)createquery
{
    return zqltypetextcreate;
}

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    NSString *value = [NSString stringWithUTF8String:(char*)sqlite3_column_text(*statement, (int)column)];
    
    return value;
}

@end