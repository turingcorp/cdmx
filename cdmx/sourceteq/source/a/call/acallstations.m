#import "acallstations.h"
#import "aparserstations.h"

@implementation acallstations

-(instancetype)init
{
    self = [super init];
    
    self.urlstring;
    self.parser = [[aparserstations alloc] init];
    
    return self;
}

@end