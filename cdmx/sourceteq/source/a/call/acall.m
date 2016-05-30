#import "acall.h"
#import "aparser.h"
#import "acallpollution.h"
#import "acallradiation.h"
#import "acallnodrive.h"
#import "acallclimate.h"

static NSInteger const standardtimeout = 12;

@implementation acall

+(instancetype)pollution
{
    acallpollution *call = [[acallpollution alloc] init];
    
    return call;
}

+(instancetype)radiation
{
    acallradiation *call = [[acallradiation alloc] init];
    
    return call;
}

+(instancetype)nodrive
{
    acallnodrive *call = [[acallnodrive alloc] init];
    
    return call;
}

+(instancetype)climate
{
    acallclimate *call = [[acallclimate alloc] init];
    
    return call;
}

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