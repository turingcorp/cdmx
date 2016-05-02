#import "vpollution.h"

@implementation vpollution

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setDelegate:self];
    self.controller = controller;
    
    return self;
}

#pragma mark public

-(void)viewdidappear
{
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    globaleffect = [[GLKBaseEffect alloc] init];
    globaltransform = globaleffect.transform;
    globaltexture = globaleffect.texture2d0;
    
    globaltransform.projectionMatrix = projectionbase;
    globaltexture.target = GLKTextureTarget2D;
}

@end


GLKBaseEffect *globaleffect;
GLKEffectPropertyTexture *globaltexture;
GLKEffectPropertyTransform *globaltransform;

@implementation vgame

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setContext:controller.model.context];
    [EAGLContext setCurrentContext:controller.model.context];
    [self setDelegate:self];
    self.controller = controller;
    [self starteffect];
    
    vgamehub *hub = [[vgamehub alloc] init:controller];
    self.hub = hub;
    
    [self addSubview:hub];
    
    NSDictionary *views = @{@"hub":hub};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[hub]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[hub]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)starteffect
{
    globaleffect = [[GLKBaseEffect alloc] init];
    globaltransform = globaleffect.transform;
    globaltexture = globaleffect.texture2d0;
    
    globaltransform.projectionMatrix = projectionbase;
    globaltexture.target = GLKTextureTarget2D;
}

#pragma mark public

-(void)pause
{
    if(!self.viewpause)
    {
        vgamepause *viewpause = [[vgamepause alloc] init:self.controller];
        self.viewpause = viewpause;
        [self addSubview:viewpause];
        
        NSDictionary *views = @{@"viewpause":viewpause};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[viewpause]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[viewpause]-0-|" options:0 metrics:metrics views:views]];
    }
}

#pragma mark -
#pragma mark glkview del

-(void)glkView:(GLKView*)view drawInRect:(CGRect)rect
{
    glDisable(GL_DEPTH_TEST);
    glClearColor(0,0,0,0);
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkdraw object:nil];
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisable(GL_BLEND);
}