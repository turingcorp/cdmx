#import "zqltypefloat.h"

static NSString* const zqltypefloatname = @"float";

@implementation zqltypefloat

-(instancetype)init
{
    self = [super init];
    self.name = zqltypefloatname;
    
    return self;
}

#pragma mark -
#pragma mark type

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    CGFloat intvalue = sqlite3_column_double(*statement, (int)column);
    NSNumber *value = @(intvalue);
    
    return value;
}

@end