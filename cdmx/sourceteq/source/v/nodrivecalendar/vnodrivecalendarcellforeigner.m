#import "vnodrivecalendarcellforeigner.h"
#import "efont.h"
#import "ecolor.h"
#import "mnodrivecalendaritemforeigner.h"

@implementation vnodrivecalendarcellforeigner

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setFont:[UIFont regularsize:16]];
    [title setNumberOfLines:0];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    self.title = title;
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark calendar cell

-(void)config:(mnodrivecalendaritemforeigner*)model
{
    [self.title setText:model.info];
}

@end