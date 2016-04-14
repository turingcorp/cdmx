#import "vaircell.h"
#import "tools.h"
#import "uifont+uifontmain.h"
#import "mstationsreadingitemindexnodata.h"

@implementation vaircell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
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
    self.amount = amount;
    
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont regularsize:15]];
    self.title = title;
    
    [self addSubview:title];
    [self addSubview:amount];
    [self addSubview:cloud];
    
    NSDictionary *views = @{@"cloud":cloud, @"amount":amount, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[cloud(20)]-7-[amount]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-11-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[cloud(20)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-9-[amount(24)]-2-[title(20)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.amount setTextColor:[UIColor whiteColor]];
        [self.title setTextColor:[UIColor whiteColor]];
        [self.cloud setTintColor:[UIColor whiteColor]];
    }
    else
    {
        [self.amount setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
        [self.title setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
        [self.cloud setTintColor:self.model.index.color];
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
    [self hover];
}

@end