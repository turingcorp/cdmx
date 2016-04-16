#import "vmenucell.h"
#import "uifont+uifontmain.h"
#import "uicolor+uicolormain.h"

@implementation vmenucell
{
    NSDictionary *attrname;
    NSDictionary *attrdescr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
 
    attrname = @{NSFontAttributeName:[UIFont boldsize:18], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
    attrdescr = @{NSFontAttributeName:[UIFont regularsize:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.5]};
    
    UILabel *title = [[UILabel alloc] init];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setNumberOfLines:0];
    [title setBackgroundColor:[UIColor clearColor]];
    self.title = title;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    self.icon = icon;
    
    [self addSubview:title];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"title":title, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(40)]-10-[title]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self setBackgroundColor:[UIColor main]];
        [self.icon setTintColor:[UIColor whiteColor]];
        [self.title setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.icon setTintColor:[UIColor main]];
        [self.title setAttributedText:self.mut];
    }
}

#pragma mark public

-(void)config:(mpagesitem*)model
{
    self.model = model;
    
    NSAttributedString *stringname = [[NSAttributedString alloc] initWithString:model.name attributes:attrname];
    NSAttributedString *stringdescr = [[NSAttributedString alloc] initWithString:model.descr attributes:attrdescr];
    self.mut = [[NSMutableAttributedString alloc] init];
    [self.mut appendAttributedString:stringname];
    [self.mut appendAttributedString:stringdescr];

    [self.icon setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self hover];
}

@end