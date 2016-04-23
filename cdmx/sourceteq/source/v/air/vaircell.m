#import "vaircell.h"
#import "tools.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"
#import "mstationsreadingitemindexnodata.h"

@implementation vaircell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UIImageView *cloud = [[UIImageView alloc] init];
    [cloud setClipsToBounds:YES];
    [cloud setUserInteractionEnabled:NO];
    [cloud setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cloud setImage:[[UIImage imageNamed:@"stations_cloud"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [cloud setContentMode:UIViewContentModeScaleAspectFit];
    self.cloud = cloud;
    
    UILabel *amount = [[UILabel alloc] init];
    [amount setUserInteractionEnabled:NO];
    [amount setTranslatesAutoresizingMaskIntoConstraints:NO];
    [amount setBackgroundColor:[UIColor clearColor]];
    [amount setFont:[UIFont regularsize:20]];
    [amount setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    self.amount = amount;
    
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont regularsize:15]];
    [title setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    self.title = title;
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setBackgroundColor:[UIColor collection]];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setUserInteractionEnabled:NO];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setBackgroundColor:[UIColor collection]];
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    [self addSubview:title];
    [self addSubview:amount];
    [self addSubview:cloud];
    
    NSDictionary *views = @{@"cloud":cloud, @"amount":amount, @"title":title, @"bordertop":bordertop, @"borderbottom":borderbottom};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[cloud(20)]-7-[amount]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-11-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[cloud(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-9-[amount(24)]-2-[title(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[borderbottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bordertop(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderbottom(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:0.2];
    }
    else
    {
        [self setAlpha:1];
    }
}

#pragma mark public

-(void)config:(mstationsreadingitem*)model
{
    NSString *amount = @"";
    
    if(![model.index isKindOfClass:[mstationsreadingitemindexnodata class]])
    {
        amount = [[tools singleton] numbertostring:@(model.index.points)];
    }
    
    self.model = model;
    [self.amount setText:amount];
    [self.title setText:model.name];
    [self.cloud setTintColor:self.model.index.color];
    [self hover];
}

@end