#import "vpollutioncharterheader.h"
#import "ecolor.h"
#import "efont.h"

@implementation vpollutioncharterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setNumberOfLines:0];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setTextAlignment:NSTextAlignmentCenter];
    [labelindex setFont:[UIFont numericsize:38]];
    [labelindex setTextColor:[UIColor main]];
    self.labelindex = labelindex;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setNumberOfLines:0];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:11]];
    [labeltitle setText:NSLocalizedString(@"vpollution_chart_header_title", nil)];
    [labeltitle setHidden:YES];
    self.labeltitle = labeltitle;
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setUserInteractionEnabled:NO];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelname setNumberOfLines:0];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setTextAlignment:NSTextAlignmentCenter];
    [labelname setFont:[UIFont boldsize:19]];
    [labelname setTextColor:[UIColor second]];
    self.labelname = labelname;
    
    [self addSubview:labelindex];
    [self addSubview:labeltitle];
    [self addSubview:labelname];
    
    NSDictionary *views = @{@"index":labelindex, @"name":labelname, @"title":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[index]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[index(43)]-(-10)-[title(14)]-0-[name(25)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    if(touches.count)
    {
        UITouch *touch = touches.anyObject;
        
        [self pointerselection:touch];
    }
}

-(void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    if(touches.count)
    {
        UITouch *touch = touches.anyObject;
        
        [self pointerselection:touch];
    }
}

-(void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self releasepointer];
}

-(void)touchesCancelled:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self releasepointer];
}

#pragma mark functionality

-(void)pointerselection:(UITouch*)touch
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       CGPoint location = [touch locationInView:welf];
                       CGFloat x = location.x;
                       CGFloat y = location.y;
                       
                       [welf.model.selected.modelselect newx:x y:y];
                       mpollutionchartitempoint *current = welf.model.selected.modelselect.current;
                       
                       NSString *stringindex = [NSString stringWithFormat:@"%@", current.index];
                       NSString *stringname = current.name;
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.labelindex setText:stringindex];
                                          [welf.labeltitle setTextColor:current.index.color];
                                          [welf.labelname setText:stringname];
                                          [welf.labeltitle setHidden:NO];
                                      });
                   });
}

-(void)releasepointer
{
    [self.model.selected.modelselect hideselector];
    [self.labelindex setText:nil];
    [self.labelname setText:nil];
    [self.labeltitle setHidden:YES];
}

@end