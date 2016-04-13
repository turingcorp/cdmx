#import "tools.h"

static NSUInteger const dayseconds = 86400;
static NSUInteger const hourseconds = 3600;
static NSUInteger const minuteseconds = 60;

@implementation tools
{
    NSNumberFormatter *numformatter;
    NSNumberFormatter *priceformatter;
    NSDateFormatter *dateformatter;
    CFStringRef stringref;
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
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", [properties valueForKey:@"appid"]]]];
}

+(NSDictionary*)defaultdict
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
    
    return dictionary;
}

+(NSInteger)timestamp
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    
    return now;
}

+(UIImage*)qrcode:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciimage = filter.outputImage;
    CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
    CFRelease(cgimage);
    
    return uiimage;
}

+(NSString*)cleanlatin:(NSString*)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
    str = [str stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
    str = [str stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
    str = [str stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
    str = [str stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
    str = [str stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
    str = [str stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
    str = [str stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
    return str;
}

+(NSString*)elapsedtimefrom:(NSUInteger)timestamp
{
    NSString *string;
    NSUInteger currenttime = [NSDate date].timeIntervalSince1970;
    NSUInteger elapsedtime = currenttime - timestamp;
    NSUInteger days = elapsedtime / dayseconds;
    
    if(days)
    {
        string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_days", nil), @(days)];
    }
    else
    {
        NSUInteger hours = (elapsedtime % dayseconds) / hourseconds;
        
        if(hours)
        {
            string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_minutes", nil), @(hours)];
        }
        else
        {
            NSUInteger minutes = (elapsedtime % hourseconds) / minuteseconds;
            string = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_minutes", nil), @(minutes)];
        }
    }
    
    return string;
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    numformatter = [[NSNumberFormatter alloc] init];
    [numformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    priceformatter = [[NSNumberFormatter alloc] init];
    [priceformatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)string
{
    NSString *newstring = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)string, nil, stringref, kCFStringEncodingUTF8);
    
    return newstring;
}

-(NSString*)numbertostring:(NSNumber*)number
{
    NSString *string = [numformatter stringFromNumber:number];
    
    return string;
}

-(NSString*)pricetostring:(NSNumber*)number currency:(NSString*)currency
{
    [priceformatter setCurrencyCode:currency];
    NSString *string = [priceformatter stringFromNumber:number];
    
    return string;
}

-(NSNumber*)stringtonumber:(NSString*)string
{
    NSNumber *number = [numformatter numberFromString:string];
    
    return number;
}

-(NSDate*)stringtodate:(NSString*)string
{
    return [dateformatter dateFromString:string];
}

@end