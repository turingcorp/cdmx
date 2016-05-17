#import "mmenu.h"

@interface mmenu ()

@property(strong, nonatomic, readwrite)NSArray<mmenusection*> *sections;

@end

@implementation mmenu

-(instancetype)init
{
    self = [super init];
    self.sections = @[];
    
    return self;
}

@end