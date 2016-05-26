#import "vpollutionpollutantdetail.h"
#import "efont.h"
#import "genericconstants.h"

static NSInteger const pollutantdetailbarheight = 150;
static NSInteger const pollutantmargintop = 10;
static NSInteger const pollutantmarginbottom = 40;
static NSInteger const pollutantmarginhr = 10;

@implementation vpollutionpollutantdetail

-(instancetype)init:(cpollutionpollutantdetail*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vpollutionpollutantdetailbar *bar = [[vpollutionpollutantdetailbar alloc] init:controller];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:pollutantdetailbarheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

#pragma mark public

-(void)viewappear
{
    if(!self.scroll)
    {
        NSDictionary *pollutants = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"pollutants" withExtension:@"plist"]];
        
        NSNumber *pollutantid = self.controller.model.serverid;
        NSString *pollutantkey = [NSString stringWithFormat:@"%@", pollutantid];
        NSDictionary *rawpollutant = pollutants[pollutantkey];
        
        if(rawpollutant)
        {
            NSString *symbol = rawpollutant[@"symbol"];
            NSString *info = rawpollutant[@"info"];
            
            if(!info)
            {
                info = @"";
            }
            
            NSDictionary *attributes = @{NSFontAttributeName:[UIFont regularsize:15]};
            NSAttributedString *attrstring = [[NSAttributedString alloc] initWithString:info attributes:attributes];
            CGFloat width = self.bounds.size.width;
            CGFloat marginhr = pollutantmarginhr + pollutantmarginhr;
            CGFloat remain = width - marginhr;
            CGSize stringsize = CGSizeMake(remain, 5000);
            CGFloat height = ceilf([attrstring boundingRectWithSize:stringsize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
            CGRect labelframe = CGRectMake(pollutantmarginhr, pollutantdetailbarheight + pollutantmargintop, remain, height);
            CGFloat scrollcontentheight = pollutantdetailbarheight + pollutantmargintop + pollutantmarginbottom + height;
            CGSize scrollcontentsize = CGSizeMake(width, scrollcontentheight);
            
            UIScrollView *scroll = [[UIScrollView alloc] init];
            [scroll setClipsToBounds:YES];
            [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
            [scroll setShowsVerticalScrollIndicator:NO];
            [scroll setShowsHorizontalScrollIndicator:NO];
            [scroll setAlwaysBounceVertical:YES];
            [scroll setBackgroundColor:[UIColor clearColor]];
            [scroll setContentSize:scrollcontentsize];
            [scroll setDelegate:self];
            self.scroll = scroll;
            
            UILabel *label = [[UILabel alloc] initWithFrame:labelframe];
            [label setUserInteractionEnabled:NO];
            [label setBackgroundColor:[UIColor clearColor]];
            [label setNumberOfLines:0];
            [label setAttributedText:attrstring];
            [label setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
            
            [scroll addSubview:label];
            [self.bar.title setText:symbol];
            [self insertSubview:scroll belowSubview:self.bar];
            
            NSDictionary *views = @{@"scroll":scroll};
            NSDictionary *metrics = @{};
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
        }
    }
}

#pragma mark -
#pragma mark scroll del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newbarheight = pollutantdetailbarheight - offsety;
    
    if(newbarheight < navbarheightmin)
    {
        newbarheight = navbarheightmin;
    }
    
    self.layoutbarheight.constant = newbarheight;
}

@end