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
    
    UILabel *labelpollutanttitle = [[UILabel alloc] init];
    [labelpollutanttitle setBackgroundColor:[UIColor clearColor]];
    [labelpollutanttitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpollutanttitle setUserInteractionEnabled:NO];
    [labelpollutanttitle setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [labelpollutanttitle setNumberOfLines:0];
    [labelpollutanttitle setFont:[UIFont regularsize:14]];
    [labelpollutanttitle setTextAlignment:NSTextAlignmentCenter];
    [labelpollutanttitle setText:NSLocalizedString(@"vpollution_chart_header_pollutanttitle", nil)];
    self.labelpollutanttitle = labelpollutanttitle;
    
    UILabel *labelpollutant = [[UILabel alloc] init];
    [labelpollutant setBackgroundColor:[UIColor clearColor]];
    [labelpollutant setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpollutant setUserInteractionEnabled:NO];
    [labelpollutant setTextColor:[UIColor main]];
    [labelpollutant setNumberOfLines:0];
    [labelpollutant setFont:[UIFont boldsize:16]];
    [labelpollutant setTextAlignment:NSTextAlignmentCenter];
    self.labelpollutant = labelpollutant;
    
    vpollutionradiochart *radiochart = [[vpollutionradiochart alloc] init];
    self.radiochart = radiochart;
    
    vpollutionfrontheaderbutton *button = [[vpollutionfrontheaderbutton alloc] init];
    [button addTarget:self action:@selector(actionbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    vpollutionfrontheadercurrent *current = [[vpollutionfrontheadercurrent alloc] init];
    [current addTarget:self action:@selector(actioncurrent:) forControlEvents:UIControlEventTouchUpInside];
    self.current = current;
    
    [self addSubview:blanket];
    [self addSubview:bordertop];
    [self addSubview:labelpollutanttitle];
    [self addSubview:labelpollutant];
    [self addSubview:radiochart];
    [self addSubview:button];
    [self addSubview:current];
    
    NSDictionary *views = @{@"bordertop":bordertop, @"blanket":blanket, @"labelpollutanttitle":labelpollutanttitle, @"labelpollutant":labelpollutant, @"radiochart":radiochart, @"button":button, @"current":current};
    NSDictionary *metrics = @{@"bordery":@(bordery), @"infomarginx":@(infomarginx)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[blanket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(bordery)-[bordertop(1)]-0-[current]-20-[radiochart]-30-[labelpollutanttitle(22)]-10-[labelpollutant(20)]-20-[button(50)]" options:0 metrics:metrics views:views]
     ];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelpollutanttitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(infomarginx)-[labelpollutant]-(infomarginx)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[radiochart]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[current]-0-|" options:0 metrics:metrics views:views]];
    
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
    
    [self.radiochart render:model.index];
    [self.current config:model];
    
    if(model.pollutant)
    {
        [self.labelpollutanttitle setHidden:NO];
        [self.labelpollutant setHidden:NO];
        [self.labelpollutant setText:model.pollutant.name];
    }
    else
    {
        [self.labelpollutanttitle setHidden:YES];
        [self.labelpollutant setHidden:YES];
    }
}

@end