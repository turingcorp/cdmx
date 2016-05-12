#import "vpollutioncharterheader.h"

@implementation vpollutioncharterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
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
                   });
}

-(void)releasepointer
{
    [self.model.selected.modelselect hideselector];
}

@end