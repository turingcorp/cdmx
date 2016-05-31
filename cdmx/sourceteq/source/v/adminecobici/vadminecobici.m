#import "vadminecobici.h"
#import "efont.h"
#import "ecolor.h"
#import "cadminecobici.h"

@interface vadminecobici ()

@property(strong, nonatomic, readwrite)NSURL *dburl;
@property(weak, nonatomic)cadminecobici *controller;

@end

@implementation vadminecobici

@dynamic controller;

-(instancetype)init:(cadminecobici*)controller
{
    self = [super init:controller];
    [self.bar title:NSLocalizedString(@"mmenu_item_adminecobici", nil)];
    [self.bar buttonmenu];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    UILabel *labelerror = [[UILabel alloc] init];
    [labelerror setBackgroundColor:[UIColor clearColor]];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelerror setNumberOfLines:0];
    [labelerror setTextAlignment:NSTextAlignmentCenter];
    [labelerror setFont:[UIFont regularsize:17]];
    [labelerror setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [labelerror setHidden:YES];
    self.labelerror = labelerror;
    
    UILabel *labelexport = [[UILabel alloc] init];
    [labelexport setBackgroundColor:[UIColor clearColor]];
    [labelexport setUserInteractionEnabled:NO];
    [labelexport setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelexport setNumberOfLines:0];
    [labelexport setTextAlignment:NSTextAlignmentCenter];
    [labelexport setFont:[UIFont regularsize:17]];
    [labelexport setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [labelexport setHidden:YES];
    self.labelexport = labelexport;
    
    UIButton *buttonretry = [[UIButton alloc] init];
    [buttonretry setHidden:YES];
    [buttonretry setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonretry setTitle:NSLocalizedString(@"vadmin_ecobici_buttonretry", nil) forState:UIControlStateNormal];
    [buttonretry.titleLabel setFont:[UIFont boldsize:15]];
    [buttonretry setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonretry setTitleColor:[UIColor colorWithWhite:0.8 alpha:1] forState:UIControlStateHighlighted];
    [buttonretry addTarget:self action:@selector(actionretry:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonretry = buttonretry;
    
    UIButton *buttonexport = [[UIButton alloc] init];
    [buttonexport setHidden:YES];
    [buttonexport setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonexport setTitle:NSLocalizedString(@"vadmin_ecobici_buttonexport", nil) forState:UIControlStateNormal];
    [buttonexport.titleLabel setFont:[UIFont boldsize:18]];
    [buttonexport setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonexport setTitleColor:[[UIColor main] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [buttonexport addTarget:self action:@selector(actionexport:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonexport = buttonexport;
    
    [self addSubview:spinner];
    [self addSubview:labelerror];
    [self addSubview:labelexport];
    [self addSubview:buttonretry];
    [self addSubview:buttonexport];
    
    NSDictionary *views = @{@"spinner":spinner, @"buttonretry":buttonretry, @"buttonexport":buttonexport, @"labelerror":labelerror, @"labelexport":labelexport};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonretry]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonexport]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelerror]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelexport]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[labelerror(130)]-0-[buttonretry(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[labelexport(130)]-0-[buttonexport(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionretry:(UIButton*)button
{
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
    [self.buttonretry setHidden:YES];
    [self.labelerror setHidden:YES];
    [self.controller pullecobicidata];
}

-(void)actionexport:(UIButton*)button
{
    [self.controller exportdb];
}

#pragma mark public

-(void)error:(NSString*)error
{
    [self.spinner setHidden:YES];
    [self.buttonretry setHidden:NO];
    [self.labelerror setHidden:NO];
    [self.labelerror setText:error];
}

-(void)succeded:(NSURL*)dburl
{
    self.dburl = dburl;
    NSString *stringexport = [NSString stringWithFormat:NSLocalizedString(@"vadmin_ecobici_labelexport", nil), @(self.controller.model.stations.count)];
    
    [self.spinner setHidden:YES];
    [self.buttonexport setHidden:NO];
    [self.labelexport setHidden:NO];
    [self.labelexport setText:stringexport];
}

@end