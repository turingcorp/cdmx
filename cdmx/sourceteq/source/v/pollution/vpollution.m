#import "vpollution.h"
#import "enotification.h"

static NSInteger const millisecondswait = 300;
static NSInteger const texturecorners = 6;

@implementation vpollution

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

#pragma mark functionality

-(void)glkstart
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
                       [EAGLContext setCurrentContext:context];
                       [self setContext:context];
                       [self setDelegate:self];
                       
                       self.datatexture = [NSMutableData dataWithLength:texturecorners * sizeof(GLKVector2)];
                       self.pointertexture = self.datatexture.mutableBytes;
                       self.pointertexture[0] = GLKVector2Make(0, 0);
                       self.pointertexture[1] = GLKVector2Make(0, 1);
                       self.pointertexture[2] = GLKVector2Make(1, 1);
                       self.pointertexture[3] = GLKVector2Make(1, 1);
                       self.pointertexture[4] = GLKVector2Make(1, 0);
                       self.pointertexture[5] = GLKVector2Make(0, 0);
                       
                       self.modeldist = [[mpollutiondist alloc] init];
                       self.baseeffect = [[GLKBaseEffect alloc] init];
                       self.baseeffect.texture2d0.target = GLKTextureTarget2D;
                   });
}

#pragma mark public

-(void)modelloaded
{
    if(self.front)
    {
        
    }
    else
    {
        vpollutionfront *front = [[vpollutionfront alloc] init:self.controller];
        self.front = front;
        [self addSubview:front];
        
        NSDictionary *views = @{@"front":front};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
        [self glkstart];
    }
}

-(void)viewdidappear
{
    if(!self.modeldist)
    {
        vpollutionfront *front = [[vpollutionfront alloc] init:self.controller];
        self.front = front;
        [self addSubview:front];
        
        NSDictionary *views = @{@"front":front};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
        
        __weak typeof(self) welf = self;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * millisecondswait),
                       dispatch_get_main_queue(),
                       ^
                       {
                           [welf glkstart];
                       });
    }
}

#pragma mark -
#pragma mark glkview del

-(void)glkView:(GLKView*)view drawInRect:(CGRect)rect
{
    glDisable(GL_DEPTH_TEST);
    glClearColor(1,1,1,1);
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    mpollutionnotificationdraw *userinfo = [[mpollutionnotificationdraw alloc] init:self.baseeffect pointertexture:self.pointertexture];
    [NSNotification glkdraw:userinfo];
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisable(GL_BLEND);
}

@end