#import "acallpollution.h"
#import "aparserpollution.h"

@implementation acallpollution

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server"]];
    [mut appendString:urls[@"pollution"]];
    self.urlstring = mut;
    self.parser = [[aparserpollution alloc] init];
    
    return self;
}

@end