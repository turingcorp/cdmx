#import "mradiationabout.h"

@interface mradiationaboutsection ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface mradiationabout ()

@property(strong, nonatomic, readwrite)NSArray<mradiationaboutsection*> *sections;

@end

@implementation mradiationabout

+(instancetype)model
{
    NSArray *file = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"radiation" withExtension:@"plist"]];
    mradiationabout *model = [[mradiationabout alloc] init:file];
    
    return model;
}

-(instancetype)init:(NSArray*)file
{
    self = [super init];
    
    NSUInteger count = file.count;
    NSMutableArray<mradiationaboutsection*> *sections = [NSMutableArray array];
    
    for(NSUInteger indexfile = 0; indexfile < count; indexfile++)
    {
        NSDictionary *dictionary = file[indexfile];
        mradiationaboutsection *section = [[mradiationaboutsection alloc] init:dictionary];
        
        [sections addObject:section];
    }
    
    self.sections = sections;
    
    return self;
}

@end