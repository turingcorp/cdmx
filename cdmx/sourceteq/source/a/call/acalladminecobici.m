#import "acalladminecobici.h"
#import "aparseradminecobici.h"

@implementation acalladminecobici

-(instancetype)init:(NSInteger)page
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server-labcd"]];
    [mut appendString:urls[@"ecobici"]];
    [mut appendFormat:@"?page=%@", @(page)];
    
    self.urlstring = mut;
    self.parser = [[aparseradminecobici alloc] init];
    
    return self;
}

@end