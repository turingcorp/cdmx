#import "vpollutionfrontheader.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"

static NSInteger const infomarginx = 10;

@implementation vpollutionfrontheader
{
    CGFloat infowidth;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.attrinfo = @{NSFontAttributeName:[UIFont regularsize:15]};
    CGFloat width = frame.size.width;
    CGFloat bordery = pollution_distposy + pollution_distposy + pollution_distminsize;
    infowidth = width - (infomarginx + infomarginx);
    
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
    [labelindextitle setFont:[UIFont regularsize:18]];
    [labelindextitle setTextColor:[UIColor colorWithWhite:0.1 alpha:1]];
    self.labelindextitle = labelindextitle;
    
    UILabel *labelindexinfo = [[UILabel alloc] init];
    [labelindexinfo setBackgroundColor:[UIColor clearColor]];
    [labelindexinfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindexinfo setUserInteractionEnabled:NO];
    [labelindexinfo setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelindexinfo setNumberOfLines:0];
    self.labelindexinfo = labelindexinfo;
    
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init];
    self.radiochart = radiochart;
    
    [self addSubview:blanket];
    [self addSubview:bordertop];
    [self addSubview:labeltitle];
    [self addSubview:labelindextitle];
    [self addSubview:labelindexinfo];
    [self addSubview:radiochart];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"labeltitle":labeltitle, @"blanket":blanket, @"labelindextitle":labelindextitle, @"labelindexinfo":labelindexinfo, @"radiochart":radiochart};
    NSDictionary *metrics = @{@"bordery":@(bordery), @"infomarginx":@(infomarginx)};
    
    self.layoutinfoheight = [NSLayoutConstraint constraintWithItem:labelindexinfo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[labeltitle(45)]-20-[radiochart]-30-[labelindextitle(22)]-(-4)-[labelindexinfo]" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[labeltitle]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[labelindextitle]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(infomarginx)-[labelindexinfo]-(infomarginx)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutinfoheight];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionreaditem*)model
{
    self.model = model;
    
    NSAttributedString *attrstr = [[NSAttributedString alloc] initWithString:model.index.info attributes:self.attrinfo];
    CGFloat infoheight = ceilf([attrstr boundingRectWithSize:CGSizeMake(infowidth, 200) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height);
    
    self.layoutinfoheight.constant = infoheight;
    [self.radiochart render:model.index];
    [self.labeltitle setText:model.name];
    [self.labelindextitle setText:model.index.name];
    [self.labelindexinfo setAttributedText:attrstr];
}

@end