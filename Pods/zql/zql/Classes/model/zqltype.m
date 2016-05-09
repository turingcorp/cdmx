#import "zqltype.h"
#import "zqltypeinteger.h"
#import "zqltypefloat.h"
#import "zqltypetext.h"
#import "zqltypeblob.h"
#import "sqlite3.h"

@implementation zqltype

+(instancetype)integer
{
    zqltypeinteger *type = [[zqltypeinteger alloc] init];
    
    return type;
}

+(instancetype)floatnum
{
    zqltypefloat *type = [[zqltypefloat alloc] init];
    
    return type;
}

+(instancetype)text
{
    zqltypetext *type = [[zqltypetext alloc] init];
    
    return type;
}

+(instancetype)blob
{
    zqltypeblob *type = [[zqltypeblob alloc] init];
    
    return type;
}

+(instancetype)fromsqltype:(NSInteger)sqltype
{
    zqltype *type;
    
    switch(sqltype)
    {
        case SQLITE_INTEGER:
            
            type = [zqltype integer];
            
            break;
            
        case SQLITE_FLOAT:
            
            type = [zqltype floatnum];
            
            break;
            
        case SQLITE_TEXT:
            
            type = [zqltype text];
            
            break;
            
        case SQLITE_BLOB:
            
            type = [zqltype blob];
            
            break;
    }
    
    return type;
}

-(NSString*)description
{
    NSString *descr = self.name;
    
    return descr;
}

#pragma mark public

-(NSString*)queryvalue:(id)value
{
    NSString *string = [NSString stringWithFormat:@"%@", value];
    
    return string;
}

-(NSString*)createquery
{
    return self.name;
}

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    return nil;
}

@end