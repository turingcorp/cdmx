#import "zqltypenull.h"

static NSString* const zqltypenullname = @"null";

@implementation zqltypenull

-(instancetype)init
{
    self = [super init];
    self.name = zqltypenullname;
    
    return self;
}

#pragma mark -
#pragma mark type

-(NSString*)queryvalue:(id)value
{
    return zqltypenullname;
}

-(id)valuefor:(sqlite3_stmt**)statement column:(NSInteger)column
{
    return nil;
}

@end