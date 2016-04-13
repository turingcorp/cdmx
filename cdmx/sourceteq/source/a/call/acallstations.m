#import "acallstations.h"
#import "aparserstations.h"
#import "privateconstants.h"

@implementation acallstations

-(instancetype)init
{
    self = [super init];
    
    self.urlstring = stationsurl;
    self.parser = [[aparserstations alloc] init];
    
    return self;
}

@end