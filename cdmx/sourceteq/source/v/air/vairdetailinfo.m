#import "vairdetailinfo.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vairdetailinfo

-(instancetype)init:(mstationsreadingitem*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont boldsize:13], NSForegroundColorAttributeName:[UIColor main]};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor second]};
    
    NSString *stringquality = model.index.name;
    NSString *stringpollutant = model.pollutant;
    
    if(!stringquality)
    {
        stringquality = @"";
    }
    
    if(!stringpollutant)
    {
        stringpollutant = @"";
    }
    
    NSAttributedString *attrquality = [[NSAttributedString alloc] initWithString:stringquality attributes:dictdescr];
    NSAttributedString *attrpollutant = [[NSAttributedString alloc] initWithString:stringpollutant attributes:dictdescr];
    
    NSAttributedString *attrtitlequality = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"air_detail_info_quality", nil) attributes:dicttitle];
    NSAttributedString *attrtitlepollutant = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"air_detail_info_pollutant", nil) attributes:dicttitle];
    
    NSMutableAttributedString *mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:attrtitlequality];
    [mutstring appendAttributedString:attrquality];
    [mutstring appendAttributedString:attrtitlepollutant];
    [mutstring appendAttributedString:attrpollutant];
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[UIColor collection]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:mutstring];
    
    [self addSubview:border];
    [self addSubview:label];
    
    NSDictionary *views = @{@"border":border, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[border]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]-5-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end