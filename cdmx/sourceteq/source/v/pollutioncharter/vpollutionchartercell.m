#import "vpollutionchartercell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vpollutionchartercell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont boldsize:17]];
    self.label = label;
    
    [self addSubview:label];
    
    return self;
}

#pragma mark public

-(void)config:(mpollutionchartitem*)model
{
    [self.label setText:model.name];
    [self hover];
}

#pragma mark -
#pragma mark vcollectioncell

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.label setTextColor:[UIColor main]];
    }
    else
    {
        [self.label setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
    }
}

@end