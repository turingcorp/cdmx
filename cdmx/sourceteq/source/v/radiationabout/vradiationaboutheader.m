#import "vradiationaboutheader.h"
#import "efont.h"
#import "ecolor.h"

@implementation vradiationaboutheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
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
    [labelinfo setTextAlignment:NSTextAlignmentCenter];
    [labelinfo setFont:[UIFont regularsize:17]];
    [labelinfo setNumberOfLines:0];
    [labelinfo setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    self.labelinfo = labelinfo;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.border = border;
    
    [self addSubview:labelinfo];
    [self addSubview:labelname];
    [self addSubview:border];
    
    NSDictionary *views = @{@"name":labelname, @"info":labelinfo, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[info]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[name(20)]-0-[info(60)]-0-[border(2)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mradiationaboutsection*)model
{
    [self.labelname setText:model.name];
    [self.labelinfo setText:model.info];
    
    mradiationaboutitem *firstitem = model.items[0];
    [self.border setBackgroundColor:firstitem.index.color];
}

@end