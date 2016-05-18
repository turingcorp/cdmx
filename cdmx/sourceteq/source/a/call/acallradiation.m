#import "acallradiation.h"
#import "aparserpollution.h"

static NSString* const lastdailyparam = @"?lastdate=%@";

@implementation acallradiation

-(instancetype)init
{
    self = [super init];
    
    mdbpollutiondaily *lastdaily = [mdbselect lastpollutiondaily];
    NSDictionary *urls = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"url" withExtension:@"plist"]];
    NSMutableString *mut = [NSMutableString string];
    [mut appendString:urls[@"server"]];
    [mut appendString:urls[@"pollution"]];
    
    if(lastdaily)
    {
        [mut appendFormat:lastdailyparam, lastdaily.date];
    }
    
    self.urlstring = mut;
    self.parser = [[aparserpollution alloc] init];
    
    return self;
}

@end