#import "vadminmetro.h"
#import "cadminmetro.h"
#import "ecolor.h"
#import "efont.h"

@interface vadminmetro ()

@property(weak, nonatomic)cadminmetro *controller;

@end

@implementation vadminmetro

@dynamic controller;

-(instancetype)init:(cadminmetro*)controller
{
    self = [super init:controller];
    [self.bar title:NSLocalizedString(@"mmenu_item_adminmetro", nil)];
    [self.bar buttonmenu];
    
    vspinner *spinner = [[vspinner alloc] init];
    [spinner setHidden:YES];
    [spinner stopAnimating];
    self.spinner = spinner;
    
    UIButton *buttoncreate = [[UIButton alloc] init];
    [buttoncreate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttoncreate setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttoncreate setTitle:NSLocalizedString(@"vadmin_metro_buttoncreate", nil) forState:UIControlStateNormal];
    [buttoncreate.titleLabel setFont:[UIFont boldsize:16]];
    [buttoncreate setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncreate addTarget:self action:@selector(actioncreate:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonexport = [[UIButton alloc] init];
    [buttonexport setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonexport setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonexport setTitle:NSLocalizedString(@"vadmin_metro_buttonexport", nil) forState:UIControlStateNormal];
    [buttonexport.titleLabel setFont:[UIFont boldsize:16]];
    [buttonexport setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonexport setHidden:YES];
    [buttonexport addTarget:self action:@selector(actionexport:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonexport = buttonexport;
    
    [self addSubview:buttoncreate];
    [self addSubview:buttonexport];
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"create":buttoncreate, @"export":buttonexport, @"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[create]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[export]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[create(50)]-50-[export(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncreate:(UIButton*)button
{
    [button setHidden:YES];
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
    [self.controller createdatabase];
}

-(void)actionexport:(UIButton*)button
{
    
}

#pragma mark public

-(void)modelcreated
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.buttonexport setHidden:NO];
}

@end