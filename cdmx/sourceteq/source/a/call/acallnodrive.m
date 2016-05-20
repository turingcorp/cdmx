#import "acallnodrive.h"
#import "aparsernodrive.h"

@implementation acallnodrive

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server"]];
    [mut appendString:urls[@"nodrive"]];
    
    self.urlstring = mut;
    self.parser = [[aparsernodrive alloc] init];
    
    return self;
}

@end