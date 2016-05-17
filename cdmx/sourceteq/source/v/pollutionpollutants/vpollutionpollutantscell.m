#import "vpollutionpollutantscell.h"

@implementation vpollutionpollutantscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{@"marginhr":@([mpollutionpollutant marginhr])};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(marginhr)-[label]-(marginhr)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionpollutant*)model
{
    [self.label setAttributedText:model.attributedstring];
}

@end