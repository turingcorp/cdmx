#import "mpollutionchartitem.h"
#import "genericconstants.h"

@interface mpollutionchartitem ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionchartitempoint*> *points;

@end

@implementation mpollutionchartitem

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    
    return self;
}

#pragma mark functionality

-(void)render
{
    gpollutionchartspikes *spatialspikes = [[gpollutionchartspikes alloc] init];
    gpollutionchartline *spatialline = [[gpollutionchartline alloc] init];
    
    NSUInteger countpoints = self.points.count;
    CGSize screensize = [UIScreen mainScreen].bounds.size;
    CGFloat width = screensize.width;
    CGFloat widthperitem = width / (countpoints - 1);
    CGFloat widthsum = 0;
    
    for(NSUInteger indexpoint = 0; indexpoint < countpoints; indexpoint++)
    {
        mpollutionchartitempoint *point = self.points[indexpoint];
        CGFloat y = pollution_drawableheight - point.index.points;
        point.x = widthsum;
        point.y = y;
        
        widthsum += widthperitem;
        
        [spatialspikes add:point];
        [spatialline add:point];
    }
    
    [spatialspikes render];
    [spatialline render];
    
    self.spatialspikes = spatialspikes;
    self.spatialline = spatialline;
}

#pragma mark public

-(void)loadmodel:(mpollution*)model
{
    [self render];
}

-(void)clean
{
    self.points = nil;
    self.spatialspikes = nil;
    self.spatialline = nil;
}

@end