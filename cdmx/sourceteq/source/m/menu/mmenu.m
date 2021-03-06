#import "mmenu.h"
#import "mmenusectioncity.h"
#import "mmenusectionmobility.h"
#import "mmenusectionapp.h"
#import "mmenusectionadmin.h"

@interface mmenu ()

@property(strong, nonatomic, readwrite)NSArray<mmenusection*> *sections;

@end

@implementation mmenu

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[mmenusectioncity alloc] init],
                      [[mmenusectionmobility alloc] init],
                      //[[mmenusectionapp alloc] init]
#if DEBUG
      
                      [[mmenusectionadmin alloc] init]
                      
#endif
                      ];
    
    return self;
}

@end