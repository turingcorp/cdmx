#import "acallpollution.h"

@implementation acallpollution

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"urls" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server"]];
    [mut appendString:urls[@"pollution"]];
    self.urlstring = mut;
    self.parser = [[aparserstations alloc] init];
    
    return self;
}

@end