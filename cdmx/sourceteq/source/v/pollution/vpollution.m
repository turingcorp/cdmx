#import "vpollution.h"
#import "enotification.h"
#import "efont.h"
#import "cpollution.h"
#import "vpollutionmenu.h"
#import "vpollutionfront.h"
#import "vpollutioncharter.h"
#import "vpollutionmap.h"
#import "msettings.h"

static NSInteger const texturecorners = 6;
static NSInteger const pollutionmenuheight = 50;

@implementation vpollution

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    vpollutionmenu *menu = [[vpollutionmenu alloc] init:self.controller];
    self.menu = menu;
    
    [self addSubview:spinner];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"spinner":spinner, @"menu":menu};
    NSDictionary *metrics = @{@"height":@(pollutionmenuheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(height)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionbuttonerror:(UIButton*)button
{
    [self loading];
    [self.controller loadpollution];
}

#pragma mark functionality

-(void)glkstart
{
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat screenwidth = screensize.width;
    CGFloat screenheight = screensize.height;
    
    if(![msettings singleton].context)
    {
        [msettings singleton].context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }
    
    [self setContext:[msettings singleton].context];
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

-(void)clearspinner
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.spinner setAlpha:1];
}

#pragma mark public

-(void)modelloaded
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.buttonerror removeFromSuperview];
                       [welf.labelerror removeFromSuperview];
                       
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC),
                                      dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                                      ^
                                      {
                                          if(!welf.context)
                                          {
                                              [welf glkstart];
                                          }
                                          
                                          dispatch_async(dispatch_get_main_queue(),
                                                         ^
                                                         {
                                                             [welf.menu currentselected];
                                                         });
                                      });
                   });
}

-(void)show_districts
{
    __weak typeof(self) welf = self;
    
    [welf loading];
    [welf.menu optionsactive:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.context];
                       [welf.controller.model districts];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf clearspinner];
                                          [welf loadfront];
                                          [welf.menu optionsactive:YES];
                                      });
                   });
}

-(void)show_chart
{
    __weak typeof(self) welf = self;
    
    [welf loading];
    [welf.menu optionsactive:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.context];
                       [welf.controller.model chart];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf clearspinner];
                                          [welf loadcharter];
                                          [welf.menu optionsactive:YES];
                                      });
                   });
}

-(void)show_map
{
    __weak typeof(self) welf = self;
    
    [welf loading];
    [welf.menu optionsactive:NO];
    [welf.option remove];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [EAGLContext setCurrentContext:welf.context];
                       [welf.controller.model map];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf clearspinner];
                                          [welf loadmap];
                                          [welf.menu optionsactive:YES];
                                      });
                   });
}

-(void)clean
{
    [self setUserInteractionEnabled:NO];
}

-(void)loading
{
    [self.option removeFromSuperview];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
}

-(void)error:(NSString*)error
{
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
    [self.option remove];
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    
    UILabel *labelerror = [[UILabel alloc] init];
    [labelerror setBackgroundColor:[UIColor clearColor]];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setNumberOfLines:0];
    [labelerror setTextAlignment:NSTextAlignmentCenter];
    [labelerror setFont:[UIFont regularsize:16]];
    [labelerror setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelerror setText:error];
    self.labelerror = labelerror;
    
    UIButton *buttonerror = [[UIButton alloc] init];
    [buttonerror setBackgroundColor:[UIColor clearColor]];
    [buttonerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonerror setClipsToBounds:YES];
    [buttonerror setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonerror setTitleColor:[[UIColor colorWithWhite:0.8 alpha:1] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [buttonerror setTitle:NSLocalizedString(@"api_retry", nil) forState:UIControlStateNormal];
    [buttonerror.titleLabel setFont:[UIFont boldsize:16]];
    [buttonerror addTarget:self action:@selector(actionbuttonerror:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonerror = buttonerror;
    
    [self addSubview:labelerror];
    [self addSubview:buttonerror];
    
    NSDictionary *views = @{@"label":labelerror, @"button":buttonerror};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[button]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[label(60)]-0-[button(40)]" options:0 metrics:metrics views:views]];
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