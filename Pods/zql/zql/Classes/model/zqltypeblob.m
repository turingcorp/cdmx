#import "zqltypeblob.h"

static NSString* const zqltypeblobname = @"blob";

@implementation zqltypeblob

-(instancetype)init
{
    self = [super init];
    self.name = zqltypeblobname;
    
    return self;
}

#pragma mark -
#pragma mark type

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    const void *rawdata = sqlite3_column_blob(*statement, (int)column);
    NSInteger datasize = sqlite3_column_bytes(*statement, (int)column);
    NSData *value = [[NSData alloc] initWithBytes:rawdata length:datasize];
    
    return value;
}

@end