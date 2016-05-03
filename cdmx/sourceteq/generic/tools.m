#import "tools.h"
#import "cmain.h"
#import "privateconstants.h"

static NSString* const shareurl = @"https://itunes.apple.com/us/app/cdmx/id%@";
static NSString* const rateurl = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@";

@implementation tools
{
    NSNumberFormatter *numformatter;
    NSDateFormatter *dateformatter;
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
    
    numformatter = [[NSNumberFormatter alloc] init];
    [numformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    
    return self;
}

#pragma mark public

-(NSString*)numbertostring:(NSNumber*)number
{
    NSString *string = [numformatter stringFromNumber:number];
    
    return string;
}

-(NSDate*)stringtodate:(NSString*)string
{
    return [dateformatter dateFromString:string];
}

@end