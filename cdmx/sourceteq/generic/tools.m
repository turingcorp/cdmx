#import "tools.h"
#import "cmain.h"
#import "privateconstants.h"

static NSString* const shareurl = @"https://itunes.apple.com/us/app/cdmx/id%@";
static NSString* const rateurl = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@";

@implementation tools
{
    NSDateFormatter *dateserverinput;
    NSDateFormatter *dateoutput;
}

+(instancetype)singleton
{
    static tools *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSString *string = [NSString stringWithFormat:rateurl, [properties valueForKey:appstoreid]];
    NSURL *url = [NSURL URLWithString:string];
                        
    [[UIApplication sharedApplication] openURL:url];
}

+(void)shareapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSString *string = [NSString stringWithFormat:shareurl, [properties valueForKey:appstoreid]];
    NSURL *url = [NSURL URLWithString:string];
    
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = [cmain singleton].view;
        act.popoverPresentationController.sourceRect = CGRectMake(([cmain singleton].view.bounds.size.width / 2.0) - 2, [cmain singleton].view.bounds.size.height - 100, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    dateserverinput = [[NSDateFormatter alloc] init];
    [dateserverinput setDateFormat:@"yyMMdd"];
    
    dateoutput = [[NSDateFormatter alloc] init];
    [dateoutput setDateFormat:@"MMMM d"];
    
    return self;
}

#pragma mark public

-(NSString*)datefromserver:(NSNumber*)serverdate
{
    NSString *datestring = [NSString stringWithFormat:@"%@", serverdate];
    NSDate *inputdate = [dateserverinput dateFromString:datestring];
    NSString *outputdate = [dateoutput stringFromDate:inputdate];
    NSMutableString *string = [NSMutableString string];
    [string appendString:[[outputdate substringToIndex:1] uppercaseString]];
    [string appendString:[outputdate substringFromIndex:1]];
    
    return string;
}

@end