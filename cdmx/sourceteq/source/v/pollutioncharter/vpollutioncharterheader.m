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
    CGPoint location = [touch locationInView:self];
    CGFloat x = location.x;
    CGFloat y = location.y;
    
    [self.model newx:x y:y];
}

-(void)releasepointer
{
    [self.model hideselector];
}

@end