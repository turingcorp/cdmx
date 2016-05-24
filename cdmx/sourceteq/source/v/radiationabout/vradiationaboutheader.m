#import "vradiationaboutheader.h"
#import "efont.h"
#import "ecolor.h"

static NSInteger const informarginhr = 10;

@implementation vradiationaboutheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    self.labelattributes = @{NSFontAttributeName:[UIFont regularsize:14]};
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelname setUserInteractionEnabled:NO];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setTextAlignment:NSTextAlignmentCenter];
    [labelname setFont:[UIFont boldsize:16]];
    [labelname setTextColor:[UIColor main]];
    self.labelname = labelname;
    
    UILabel *labelinfo = [[UILabel alloc] init];
    [labelinfo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelinfo setUserInteractionEnabled:NO];
    [labelinfo setBackgroundColor:[UIColor clearColor]];
    [labelinfo setNumberOfLines:0];
    [labelinfo setTextAlignment:NSTextAlignmentCenter];
    [labelinfo setTextColor:[UIColor colorWithWhite:0.55 alpha:1]];
    self.labelinfo = labelinfo;
    
    [self addSubview:labelinfo];
    [self addSubview:labelname];
    
    NSDictionary *views = @{@"name":labelname, @"info":labelinfo};
    NSDictionary *metrics = @{@"margin":@(informarginhr)};
    
    self.layoutlabelinfoheight = [NSLayoutConstraint constraintWithItem:labelinfo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[info]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[name(18)]-0-[info]-7-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelinfoheight];
    
    return self;
}

#pragma mark public

-(void)config:(mradiationaboutsection*)model
{
    mradiationaboutitem *firstitem = model.items[0];
    [self.labelname setText:firstitem.index.name];
    
    CGFloat width = self.bounds.size.width;
    CGFloat labelmargin = informarginhr + informarginhr;
    CGFloat labelwidth = width - labelmargin;
    CGSize size = CGSizeMake(labelwidth, 1000);
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:model.info attributes:self.labelattributes];
    CGFloat height = ceilf([string boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    self.layoutlabelinfoheight.constant = height;
    
    [self.labelinfo setAttributedText:string];
}

@end