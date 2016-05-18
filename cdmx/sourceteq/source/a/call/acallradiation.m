#import "acallradiation.h"
#import "aparserradiation.h"

@implementation acallradiation

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server"]];
    [mut appendString:urls[@"radiation"]];
    
    self.urlstring = mut;
    self.parser = [[aparserradiation alloc] init];
    
    return self;
}

@end