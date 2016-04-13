#import "acall.h"
#import "aparser.h"

@implementation acall

-(instancetype)init
{
    self = [super init];
    
    self.urlstring = @"";
    self.post = NO;
    self.timeout = 25;
    self.cachepolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    return self;
}

#pragma mark public

-(NSURLRequest*)request
{
    NSURL *url = [NSURL URLWithString:self.urlstring];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:self.cachepolicy timeoutInterval:self.timeout];
    
#if DEBUG
    
    NSLog(@"%@", self.urlstring);
    
#endif
    
    return request;
}

@end