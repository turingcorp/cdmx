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
    
    UIButton *buttoncreate = [[UIButton alloc] init];
    [buttoncreate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttoncreate setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttoncreate setTitle:NSLocalizedString(@"vadmin_metro_buttoncreate", nil) forState:UIControlStateNormal];
    [buttoncreate.titleLabel setFont:[UIFont boldsize:16]];
    [buttoncreate setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.buttoncreate = buttoncreate;
    
    UIButton *buttonexport = [[UIButton alloc] init];
    [buttonexport setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonexport setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonexport setTitle:NSLocalizedString(@"vadmin_metro_buttonexport", nil) forState:UIControlStateNormal];
    [buttonexport.titleLabel setFont:[UIFont boldsize:16]];
    [buttonexport setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonexport setHidden:YES];
    self.buttonexport = buttonexport;
    
    [self addSubview:buttoncreate];
    [self addSubview:buttonexport];
    
    NSDictionary *views = @{@"create":buttoncreate, @"export":buttonexport};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[create]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[export]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[create(40)]-50-[export(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end