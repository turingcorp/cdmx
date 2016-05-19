#import "vpollution.h"
#import "enotification.h"
#import "cpollution.h"
#import "vpollutionmenu.h"
#import "vpollutionfront.h"
#import "vpollutioncharter.h"
#import "vpollutionmap.h"

static NSInteger const texturecorners = 6;
static NSInteger const pollutionmenuheight = 50;

@implementation vpollution

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

-(void)dealloc
{
    NSLog(@"dealloc");
}

#pragma mark functionality

-(void)glkstart
{
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat screenwidth = screensize.width;
    CGFloat screenheight = screensize.height;
    
    self.strongcontext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [self setContext:self.strongcontext];
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

-(void)loadmenu
{
    vpollutionmenu *menu = [[vpollutionmenu alloc] init:self.controller];
    self.menu = menu;
    
    [self addSubview:menu];
    
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{@"height":@(pollutionmenuheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(height)]-0-|" options:0 metrics:metrics views:views]];
}

-(void)loadoption:(vpollutionoption*)option
{
    self.option = option;
    [self insertSubview:option belowSubview:self.menu];
    
    NSDictionary *views = @{@"option":option};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[option]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[option]-0-|" options:0 metrics:metrics views:views]];
}

-(void)loadfront
{
    vpollutionfront *front = [[vpollutionfront alloc] init:self.controller];
    [self loadoption:front];
}

-(void)loadcharter
{
    vpollutioncharter *charter = [[vpollutioncharter alloc] init:self.controller];
    [self loadoption:charter];
}

-(void)loadmap
{
    vpollutionmap *map = [[vpollutionmap alloc] init:self.controller];
    [self loadoption:map];
}

#pragma mark public

-(void)modelloaded
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       if(!welf.strongcontext)
                       {
                           [welf glkstart];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf loadmenu];
                                          });
                       }
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf show_districts];
                                      });
                   });
}

-(void)show_districts
{
    __weak typeof(self) welf = self;
    
    [welf.menu setUserInteractionEnabled:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.strongcontext];
                       [welf.controller.model districts];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf loadfront];
                                          [welf.menu setUserInteractionEnabled:YES];
                                      });
                   });
}

-(void)show_chart
{
    __weak typeof(self) welf = self;
    
    [welf.menu setUserInteractionEnabled:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.strongcontext];
                       [welf.controller.model chart];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self loadcharter];
                                          [welf.menu setUserInteractionEnabled:YES];
                                      });
                   });
}

-(void)show_map
{
    __weak typeof(self) welf = self;
    
    [welf.menu setUserInteractionEnabled:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.strongcontext];
                       [welf.controller.model map];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf loadmap];
                                          [welf.menu setUserInteractionEnabled:YES];
                                      });
                   });
}

-(void)clean
{
    [self setUserInteractionEnabled:NO];
    self.strongcontext = nil;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:nil];
                   });
}

#pragma mark -
#pragma mark glkview del

-(void)glkView:(GLKView*)view drawInRect:(CGRect)rect
{
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_DITHER);
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