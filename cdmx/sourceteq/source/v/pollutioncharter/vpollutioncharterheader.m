#import "vpollutioncharterheader.h"
#import "ecolor.h"
#import "efont.h"

static const char *queuename = "charterqueue";

@implementation vpollutioncharterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.queue = dispatch_queue_create(queuename, DISPATCH_QUEUE_SERIAL);
    dispatch_set_target_queue(self.queue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0));
    
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setNumberOfLines:0];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setTextAlignment:NSTextAlignmentCenter];
    [labelindex setFont:[UIFont numericsize:36]];
    [labelindex setTextColor:[UIColor blackColor]];
    [labelindex setHidden:YES];
    self.labelindex = labelindex;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setNumberOfLines:0];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:12]];
    [labeltitle setText:NSLocalizedString(@"vpollution_chart_header_title", nil)];
    [labeltitle setHidden:YES];
    self.labeltitle = labeltitle;
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setUserInteractionEnabled:NO];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelname setNumberOfLines:0];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setTextAlignment:NSTextAlignmentCenter];
    [labelname setFont:[UIFont regularsize:13]];
    [labelname setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    [labelname setHidden:YES];
    self.labelname = labelname;
    
    [self addSubview:labelindex];
    [self addSubview:labeltitle];
    [self addSubview:labelname];
    
    NSDictionary *views = @{@"index":labelindex, @"name":labelname, @"title":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[index]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[index(41)]-(-8)-[title(16)]-0-[name(16)]" options:0 metrics:metrics views:views]];
    
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
    
    dispatch_async(welf.queue,
                   ^
                   {
                       CGPoint location = [touch locationInView:welf];
                       CGFloat x = location.x;
                       
                       if(x != welf.lastx)
                       {
                           welf.lastx = x;
                           [welf.model.selected.modelselect newx:x];
                           
                           mpollutionchartitempoint *current = welf.model.selected.modelselect.current;
                           NSString *stringindex = [NSString stringWithFormat:@"%@", current.index];
                           NSString *stringname = current.name;
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.labelindex setText:stringindex];
                                              [welf.labelname setText:stringname];
                                              [welf.labeltitle setTextColor:current.index.color];
                                          });
                       }
                       
                       if(welf.labelindex.isHidden)
                       {
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.labelindex setHidden:NO];
                                              [welf.labelname setHidden:NO];
                                              [welf.labeltitle setHidden:NO];
                                          });
                       }
                   });
}

-(void)releasepointer
{
    __weak typeof(self) welf = self;
    
    dispatch_async(welf.queue,
                   ^
                   {
                       [welf.model.selected.modelselect hideselector];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          
                                          [welf.labelindex setHidden:YES];
                                          [welf.labelname setHidden:YES];
                                          [welf.labeltitle setHidden:YES];
                                      });
                   });
}

@end