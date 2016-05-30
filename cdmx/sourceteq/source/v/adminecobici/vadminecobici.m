#import "vadminecobici.h"
#import "efont.h"
#import "ecolor.h"

@implementation vadminecobici

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar title:NSLocalizedString(@"mmenu_item_adminecobici", nil)];
    [self.bar buttonmenu];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    UIButton *buttonretry = [[UIButton alloc] init];
    [buttonretry setHidden:YES];
    [buttonretry setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonretry setTitle:NSLocalizedString(@"vadmin_ecobici_buttonretry", nil) forState:UIControlStateNormal];
    [buttonretry.titleLabel setFont:[UIFont boldsize:15]];
    [buttonretry setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonretry setTitleColor:[UIColor colorWithWhite:0.8 alpha:1] forState:UIControlStateHighlighted];
    self.buttonretry = buttonretry;
    
    UIButton *buttonexport = [[UIButton alloc] init];
    [buttonexport setHidden:YES];
    [buttonexport setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonexport setTitle:NSLocalizedString(@"vadmin_ecobici_buttonexport", nil) forState:UIControlStateNormal];
    [buttonexport.titleLabel setFont:[UIFont boldsize:15]];
    [buttonexport setTitleColor:[UIColor main] forState:UIControlStateNormal];
    [buttonexport setTitleColor:[[UIColor main] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    self.buttonretry = buttonretry;
    
    [self addSubview:spinner];
    [self addSubview:buttonretry];
    [self addSubview:buttonexport];
    
    NSDictionary *views = @{@"spinner":spinner, @"buttonretry":buttonretry, @"buttonexport":buttonexport};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonretry]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonexport]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[labelretry(60)]-0-[buttonretry(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[labelexport(60)]-0-[buttonexport(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end