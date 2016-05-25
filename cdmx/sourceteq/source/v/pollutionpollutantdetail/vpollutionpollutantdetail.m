#import "vpollutionpollutantdetail.h"
#import "vpollutionpollutantdetailbar.h"

static NSInteger const pollutantdetailbarheight = 150;

@implementation vpollutionpollutantdetail

-(instancetype)init:(cpollutionpollutantdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vpollutionpollutantdetailbar *bar = [[vpollutionpollutantdetailbar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{@"barheight":@(pollutantdetailbarheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(barheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)viewappear
{
    /*
    NSDictionary *pollutants = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"pollutants" withExtension:@"plist"]];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont regularsize:15]};
    
    for(mpollutionpollutant *item in welf.controller.items)
    {
        NSNumber *pollutantid = item.serverid;
        NSString *pollutantkey = [NSString stringWithFormat:@"%@", pollutantid];
        NSDictionary *rawpollutant = pollutants[pollutantkey];
        
        if(rawpollutant)
        {
            NSString *symbol = rawpollutant[@"symbol"];
            NSString *info = rawpollutant[@"info"];
            
            if(!symbol)
            {
                symbol = @"";
            }
            
            [item createattributedstring:info attributes:attributes width:width];
            item.symbol = symbol;
        }
    }*/
}

@end