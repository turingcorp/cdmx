#import "vpollutionfrontheader.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"
#import "vpollutionfrontheaderbutton.h"
#import "vpollution.h"
#import "vpollutionfront.h"

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
    CGFloat bordery = pollution_drawableheight;
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
    [labelindexinfo setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [labelindexinfo setNumberOfLines:0];
    self.labelindexinfo = labelindexinfo;
    
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init];
    self.radiochart = radiochart;
    
    vpollutionfrontheaderbutton *button = [[vpollutionfrontheaderbutton alloc] init];
    [button addTarget:self action:@selector(actionbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    vpollutionfrontheadercurrent *current = [[vpollutionfrontheadercurrent alloc] init];
    [current addTarget:self action:@selector(actioncurrent:) forControlEvents:UIControlEventTouchUpInside];
    self.current = current;
    
    [self addSubview:blanket];
    [self addSubview:bordertop];
    [self addSubview:labelindextitle];
    [self addSubview:labelindexinfo];
    [self addSubview:radiochart];
    [self addSubview:button];
    [self addSubview:current];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"blanket":blanket, @"labelindextitle":labelindextitle, @"labelindexinfo":labelindexinfo, @"radiochart":radiochart, @"button":button, @"current":current};
    NSDictionary *metrics = @{@"bordery":@(bordery), @"infomarginx":@(infomarginx)};
    
    self.layoutinfoheight = [NSLayoutConstraint constraintWithItem:labelindexinfo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[current]-20-[radiochart]-30-[labelindextitle(22)]-2-[labelindexinfo]-20-[button(50)]" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[labelindextitle]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(infomarginx)-[labelindexinfo]-(infomarginx)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[current]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutinfoheight];
    
    return self;
}

#pragma mark actions

-(void)actionbutton:(UIButton*)button
{
    [self.controller imeca];
}

-(void)actioncurrent:(UIButton*)button
{
    [(vpollutionfront*)self.controller.view.option showlist];
}

#pragma mark public

-(void)config:(mpollutionfrontitem*)model controller:(cpollution*)controller
{
    self.model = model;
    self.controller = controller;
    
    NSAttributedString *attrstr = [[NSAttributedString alloc] initWithString:model.index.info attributes:self.attrinfo];
    CGFloat infoheight = ceilf([attrstr boundingRectWithSize:CGSizeMake(infowidth, 300) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height);
    
    self.layoutinfoheight.constant = infoheight;
    [self.radiochart render:model.index];
    [self.labelindextitle setText:model.index.name];
    [self.labelindexinfo setAttributedText:attrstr];
    [self.current config:model];
}

@end