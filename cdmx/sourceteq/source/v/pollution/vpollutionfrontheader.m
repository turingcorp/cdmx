#import "vpollutionfrontheader.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"

@implementation vpollutionfrontheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat bordery = pollution_distposy + pollution_distposy + pollution_distminsize;
    
    UIView *blanket = [[UIView alloc] init];
    [blanket setUserInteractionEnabled:NO];
    [blanket setClipsToBounds:YES];
    [blanket setTranslatesAutoresizingMaskIntoConstraints:NO];
    [blanket setBackgroundColor:[UIColor whiteColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:16]];
    [labeltitle setTextColor:[UIColor main]];
    self.labeltitle = labeltitle;
    
    UILabel *labelindextitle = [[UILabel alloc] init];
    [labelindextitle setBackgroundColor:[UIColor clearColor]];
    [labelindextitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindextitle setUserInteractionEnabled:NO];
    [labelindextitle setTextAlignment:NSTextAlignmentCenter];
    [labelindextitle setFont:[UIFont boldsize:15]];
    [labelindextitle setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    self.labeltitle = labelindextitle;
    
    UILabel *labelindexinfo = [[UILabel alloc] init];
    [labelindexinfo setBackgroundColor:[UIColor clearColor]];
    [labelindexinfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindexinfo setUserInteractionEnabled:NO];
    [labelindexinfo setFont:[UIFont regularsize:15]];
    [labelindexinfo setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelindexinfo setNumberOfLines:0];
    self.labelindexinfo = labelindexinfo;
    
    [self addSubview:blanket];
    [self addSubview:bordertop];
    [self addSubview:labeltitle];
    [self addSubview:labelindextitle];
    [self addSubview:labelindexinfo];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"labeltitle":labeltitle, @"blanket":blanket, @"labelindextitle":labelindextitle, @"labelindexinfo":labelindexinfo};
    NSDictionary *metrics = @{@"bordery":@(bordery)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[labeltitle(45)]" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labeltitle]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionreaditem*)model
{
    self.model = model;
    
    [self.labeltitle setText:model.name];
    
    [self.radiochart removeFromSuperview];
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init:model.index];
    self.radiochart = radiochart;
    
    [self addSubview:radiochart];
    
    NSDictionary *views = @{@"labeltitle":self.labeltitle, @"radiochart":radiochart};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeltitle]-20-[radiochart]" options:0 metrics:metrics views:views]];
}

@end