#import "vnodrivecalendarcellweek.h"
#import "mnodrivecalendaritemweek.h"
#import "efont.h"
#import "ecolor.h"

@implementation vnodrivecalendarcellweek

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *name = [[UILabel alloc] init];
    [name setUserInteractionEnabled:NO];
    [name setTranslatesAutoresizingMaskIntoConstraints:NO];
    [name setBackgroundColor:[UIColor clearColor]];
    [name setFont:[UIFont boldsize:13]];
    [name setTextColor:[UIColor main]];
    [name setUserInteractionEnabled:NO];
    self.name = name;
    
    [self addSubview:name];
    
    NSDictionary *views = @{@"name":name};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[name(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark calendar cell

-(void)config:(mnodrivecalendaritemweek*)model
{
    [self.name setText:model.day];
}

@end