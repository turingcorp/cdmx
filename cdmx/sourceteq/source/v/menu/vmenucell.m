#import "vmenucell.h"
#import "uifont+uifontmain.h"

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
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-90-[title]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    }
    else
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(mpagesitem*)model
{
    self.model = model;
    
    NSAttributedString *stringname = [[NSAttributedString alloc] initWithString:model.name attributes:attrname];
    NSAttributedString *stringdescr = [[NSAttributedString alloc] initWithString:model.descr attributes:attrdescr];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:stringname];
    [mut appendAttributedString:stringdescr];
    
    [self.title setAttributedText:mut];
    [self hover];
}

@end