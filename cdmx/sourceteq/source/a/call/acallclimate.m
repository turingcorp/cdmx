#import "acallclimate.h"
#import "aparserclimate.h"

@implementation acallclimate

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server-weather"]];
    [mut appendString:urls[@"forecast"]];
    
    self.urlstring = mut;
    self.parser = [[aparserclimate alloc] init];
    
    return self;
}

@end