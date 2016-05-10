#import "zqltypenull.h"

static NSString* const zqltypenullname = @"null";
static NSString* const zqltypenullcreate = @"NULL";

@implementation zqltypenull

-(instancetype)init
{
    self = [super init];
    self.name = zqltypenullname;
    
    return self;
}

#pragma mark -
#pragma mark type

-(NSString*)createquery
{
    return zqltypenullcreate;
}

@end