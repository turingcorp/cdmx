#import "vpollutionmapheader.h"
#import "efont.h"
#import "ecolor.h"

static NSInteger const maxfractionskm = 1;

@implementation vpollutionmapheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont regularsize:17]];
    [label setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
    [label setNumberOfLines:0];
    [label setText:NSLocalizedString(@"vpollution_map_header_loading", nil)];
    self.label = label;
    
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setTextAlignment:NSTextAlignmentCenter];
    [labelindex setFont:[UIFont numericsize:26]];
    [labelindex setTextColor:[UIColor blackColor]];
    self.labelindex = labelindex;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:10]];
    [labeltitle setText:NSLocalizedString(@"vpollution_map_header_imeca", nil)];
    [labeltitle setTextColor:[UIColor blackColor]];
    [labeltitle setHidden:YES];
    self.labeltitle = labeltitle;
    
    UILabel *labelstation = [[UILabel alloc] init];
    [labelstation setBackgroundColor:[UIColor clearColor]];
    [labelstation setUserInteractionEnabled:NO];
    [labelstation setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelstation setTextAlignment:NSTextAlignmentCenter];
    [labelstation setFont:[UIFont boldsize:15]];
    [labelstation setTextColor:[UIColor main]];
    self.labelstation = labelstation;
    
    UILabel *labelkm = [[UILabel alloc] init];
    [labelkm setBackgroundColor:[UIColor clearColor]];
    [labelkm setUserInteractionEnabled:NO];
    [labelkm setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelkm setTextAlignment:NSTextAlignmentCenter];
    [labelkm setFont:[UIFont regularsize:13]];
    [labelkm setTextColor:[UIColor main]];
    self.labelkm = labelkm;
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setImage:[[UIImage imageNamed:@"generic_circle"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeCenter];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setHidden:YES];
    self.circle = circle;
    
    [circle addSubview:labelindex];
    [self addSubview:label];
    [self addSubview:labeltitle];
    [self addSubview:labelstation];
    [self addSubview:labelkm];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"label":label, @"index":labelindex, @"title":labeltitle, @"station":labelstation, @"km":labelkm, @"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[station]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[km]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[index]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-4-[index]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[station(18)]-0-[km(16)]-5-[circle(90)]-(-12)-[title(16)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)deniedlocation
{
    [self.label setText:NSLocalizedString(@"vpollution_map_header_denied", nil)];
}

-(void)closerstationfound:(mpollutionmapitem*)model
{
    NSString *strindex = [NSString stringWithFormat:@"%@", model.index];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:maxfractionskm];
    NSString *strkm = [NSString stringWithFormat:NSLocalizedString(@"vpollution_map_header_km", nil), [formatter stringFromNumber:@(model.kilometers)]];
    
    [self.label removeFromSuperview];
    [self.labelindex setText:strindex];
    [self.labelstation setText:model.name];
    [self.labelkm setText:strkm];
    [self.labeltitle setHidden:NO];
    [self.circle setTintColor:model.index.color];
    [self.circle setHidden:NO];
}

@end