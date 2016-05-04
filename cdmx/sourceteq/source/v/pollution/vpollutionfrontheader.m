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
    
    CGFloat height = frame.size.height;
    CGFloat bordery = pollution_distposy + pollution_distposy + pollution_distminsize;
    CGFloat contentheight = height - bordery;
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:15]];
    [labeltitle setTextColor:[UIColor main]];
    [labeltitle setText:@"Resumen general"];
    self.labeltitle = labeltitle;
    
    
    
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init];
    self.radiochart = radiochart;
    
    [self addSubview:bordertop];
    [self addSubview:labeltitle];
    [self addSubview:radiochart];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"labeltitle":labeltitle, @"radiochart":radiochart};
    NSDictionary *metrics = @{@"bordery":@(bordery)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[labeltitle(40)]-0-[radiochart]-0-|" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labeltitle]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end