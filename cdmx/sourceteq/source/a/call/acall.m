#import "acall.h"
#import "aparser.h"

static NSInteger const standardtimeout = 15;

@implementation acall

-(instancetype)init
{
    self = [super init];
    
    self.urlstring = @"";
    self.post = NO;
    self.timeout = standardtimeout;
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