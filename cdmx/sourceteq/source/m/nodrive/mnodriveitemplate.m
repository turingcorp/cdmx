#import "mnodriveitemplate.h"
#import "mnodriveitemplateyellow.h"
#import "mnodriveitemplatepink.h"
#import "mnodriveitemplatered.h"
#import "mnodriveitemplategreen.h"
#import "mnodriveitemplateblue.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(assign, nonatomic, readwrite)NSInteger number;

@end

@implementation mnodriveitemplate

+(instancetype)number:(NSInteger)number
{
    mnodriveitemplate *model = [[mnodriveitemplate alloc] init];
 
    switch(number)
    {
        case 5:
        case 6:
            
            model = [[mnodriveitemplateyellow alloc] init:number];
            
            break;
            
        case 7:
        case 8:
            
            model = [[mnodriveitemplatepink alloc] init:number];
            
            break;
            
        case 3:
        case 4:
            
            model = [[mnodriveitemplatered alloc] init:number];
            
            break;
            
        case 1:
        case 2:
            
            model = [[mnodriveitemplategreen alloc] init:number];
            
            break;
            
        case 0:
        case 9:
            
            model = [[mnodriveitemplateblue alloc] init:number];
            
            break;
    }
    
    return model;
}

-(instancetype)init:(NSInteger)number
{
    self = [self init];
    self.number = number;
    
    return self;
}

-(NSString*)description
{
    NSString *descr = [NSString stringWithFormat:@"%@", @(self.number)];
    
    return descr;
}

@end