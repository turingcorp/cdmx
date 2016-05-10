#import "vpollution.h"
#import "enotification.h"
#import "cpollution.h"

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
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat screenwidth = screensize.width;
    CGFloat screenheight = screensize.height;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.context];
    [self setContext:self.context];
    [self setDelegate:self];

    self.datatexture = [NSMutableData dataWithLength:texturecorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, 1);
    self.pointertexture[2] = GLKVector2Make(1, 1);
    self.pointertexture[3] = GLKVector2Make(1, 1);
    self.pointertexture[4] = GLKVector2Make(1, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    self.baseeffect = [[GLKBaseEffect alloc] init];
    self.baseeffect.texture2d0.target = GLKTextureTarget2D;
    self.baseeffect.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, screenwidth, screenheight, 0, 1, -1);
}

#pragma mark functionality

-(void)loadfront
{
    [self.front removeFromSuperview];
    
    vpollutionfront *front = [[vpollutionfront alloc] init:self.controller];
    self.front = front;
    [self addSubview:front];
    
    NSDictionary *views = @{@"front":front};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[front]-0-|" options:0 metrics:metrics views:views]];
}

#pragma mark public

-(void)modelloaded
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if(!welf.context)
                       {
                           [welf glkstart];
                       }
                       
                       [EAGLContext setCurrentContext:welf.context];
                       [welf show_districts];
                   });
}

-(void)show_districts
{
    __weak typeof(self) welf = self;
    [welf.controller show_districts];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf loadfront];
                   });
}

-(void)show_today
{
    
}

-(void)show_history
{
    
}

-(void)show_map
{
    
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