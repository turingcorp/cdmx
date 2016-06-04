#import "vecobicicell.h"
#import "efont.h"
#import "ecolor.h"

@interface vecobicicell ()

@property(weak, nonatomic)mecobiciitem *model;
@property(strong, nonatomic)NSNumberFormatter *numberformatter;
@property(strong, nonatomic)NSDictionary *attrtitle;
@property(strong, nonatomic)NSDictionary *attrkm;

@end

@implementation vecobicicell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeScaleAspectFit];
    [circle setImage:[[UIImage imageNamed:@"generic_halo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.circle = circle;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    self.label = label;
    
    UILabel *number = [[UILabel alloc] init];
    [number setBackgroundColor:[UIColor clearColor]];
    [number setUserInteractionEnabled:NO];
    [number setFont:[UIFont boldsize:10]];
    [number setTextAlignment:NSTextAlignmentCenter];
    [number setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.number = number;
    
    self.attrtitle = @{NSFontAttributeName:[UIFont regularsize:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.2 alpha:1]};
    self.attrkm = @{NSFontAttributeName:[UIFont regularsize:14], NSForegroundColorAttributeName:[UIColor blackColor]};
    self.numberformatter = [[NSNumberFormatter alloc] init];
    [self.numberformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [self.numberformatter setMaximumFractionDigits:2];
    
    [circle addSubview:number];
    [self addSubview:circle];
    [self addSubview:label];
    
    NSDictionary *views = @{@"number":number, @"label":label, @"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[number]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[number]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[circle(34)]-4-[label]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark private

-(void)createstring
{
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    
    if(self.model.kilometers > 0)
    {
        NSString *stringnum = [self.numberformatter stringFromNumber:@(self.model.kilometers)];
        NSString *stringkm = [NSString stringWithFormat:NSLocalizedString(@"vecobici_cell_km", nil), stringnum];
        
        NSAttributedString *astringkm = [[NSAttributedString alloc] initWithString:stringkm attributes:self.attrkm];
        [mut appendAttributedString:astringkm];
    }
    
    NSAttributedString *astringtitle = [[NSAttributedString alloc] initWithString:self.model.name attributes:self.attrtitle];
    [mut appendAttributedString:astringtitle];
    
    [self.label setAttributedText:mut];
}

#pragma mark public

-(void)config:(mecobiciitem*)model
{
    self.model = model;
    NSString *stationnumber = [NSString stringWithFormat:@"%@", model.stationid];
    [self.number setText:stationnumber];
    
    [self createstring];
    [self hover];
}

#pragma mark -
#pragma mark col cell

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:1];
        [self.number setTextColor:[UIColor blackColor]];
        [self.circle setTintColor:[UIColor main]];
    }
    else
    {
        [self setAlpha:0.4];
        [self.number setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
        [self.circle setTintColor:[UIColor background]];
    }
}

@end