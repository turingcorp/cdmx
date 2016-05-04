#import "vpollution.h"
#import "enotification.h"

@implementation vpollution

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setDelegate:self];
    self.controller = controller;
    
    return self;
}

#pragma mark functionality

-(void)glkstart
{
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    self.modeltextures = [[mpollutiontextures alloc] init];
    self.baseeffect = [[GLKBaseEffect alloc] init];
    self.baseeffect.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, 300, 300, 0, 1, -1);
    self.baseeffect.texture2d0.target = GLKTextureTarget2D;
}

#pragma mark public

-(void)viewdidappear
{
    if(!self.modeltextures)
    {
        [self glkstart];
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
    
    mpollutionnotificationdraw *userinfo = [[mpollutionnotificationdraw alloc] init:self.baseeffect];
    [NSNotification glkdraw:userinfo];
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisable(GL_BLEND);
}

@end