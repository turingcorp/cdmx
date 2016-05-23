#import "vnodrivecalendarcellweek.h"
#import "mnodrivecalendaritemweek.h"
#import "efont.h"
#import "ecolor.h"

@implementation vnodrivecalendarcellweek

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *name = [[UILabel alloc] init];
    [name setUserInteractionEnabled:NO];
    [name setTranslatesAutoresizingMaskIntoConstraints:NO];
    [name setBackgroundColor:[UIColor clearColor]];
    [name setFont:[UIFont boldsize:14]];
    [name setTextColor:[UIColor main]];
    [name setUserInteractionEnabled:NO];
    [name setTextAlignment:NSTextAlignmentRight];
    self.name = name;
    
    UILabel *numbera = [[UILabel alloc] init];
    [numbera setUserInteractionEnabled:NO];
    [numbera setTranslatesAutoresizingMaskIntoConstraints:NO];
    [numbera setBackgroundColor:[UIColor clearColor]];
    [numbera setFont:[UIFont regularsize:16]];
    [numbera setTextColor:[UIColor blackColor]];
    [numbera setUserInteractionEnabled:NO];
    [numbera setTextAlignment:NSTextAlignmentCenter];
    self.numbera = numbera;
    
    UILabel *numberb = [[UILabel alloc] init];
    [numberb setUserInteractionEnabled:NO];
    [numberb setTranslatesAutoresizingMaskIntoConstraints:NO];
    [numberb setBackgroundColor:[UIColor clearColor]];
    [numberb setFont:[UIFont regularsize:18]];
    [numberb setTextColor:[UIColor blackColor]];
    [numberb setUserInteractionEnabled:NO];
    [numberb setTextAlignment:NSTextAlignmentCenter];
    self.numberb = numberb;
    
    UIImageView *circlea = [[UIImageView alloc] init];
    [circlea setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circlea setClipsToBounds:YES];
    [circlea setContentMode:UIViewContentModeScaleAspectFit];
    [circlea setUserInteractionEnabled:NO];
    [circlea setImage:[[UIImage imageNamed:@"generic_circle"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.circlea = circlea;
    
    UIImageView *circleb = [[UIImageView alloc] init];
    [circleb setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circleb setClipsToBounds:YES];
    [circleb setContentMode:UIViewContentModeScaleAspectFit];
    [circleb setUserInteractionEnabled:NO];
    [circleb setImage:[[UIImage imageNamed:@"generic_circle"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.circleb = circleb;
    
    [self addSubview:name];
    [self addSubview:circlea];
    [self addSubview:circleb];
    [self addSubview:numbera];
    [self addSubview:numberb];
    
    NSDictionary *views = @{@"name":name, @"circlea":circlea, @"circleb":circleb, @"numbera":numbera, @"numberb":numberb};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name(120)]-8-[circlea(70)]-0-[circleb(70)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[name]-8-[numbera(70)]-0-[numberb(70)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[circlea]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[circleb]-15-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[numbera]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[numberb]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark calendar cell

-(void)config:(mnodrivecalendaritemweek*)model
{
    [self.name setText:model.day];
    [self.circlea setTintColor:model.color];
    [self.circleb setTintColor:model.color];
    [self.numbera setText:model.numbera];
    [self.numberb setText:model.numberb];
}

@end