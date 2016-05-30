#import "teststools.h"

@implementation teststools

+(id)loadmock:(NSString*)jsonname
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *jsonurl = [bundle URLForResource:jsonname withExtension:@"json"];
    NSData *jsondata = [NSData dataWithContentsOfURL:jsonurl options:NSDataReadingUncached error:nil];
    id mock =[NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingAllowFragments error:nil];
    
    return mock;
}

@end