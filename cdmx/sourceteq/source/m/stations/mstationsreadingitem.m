#import "mstationsreadingitem.h"

@implementation mstationsreadingitem

-(instancetype)init:(NSString*)name
{
    self = [super init];
    
    NSMutableString *mut = [NSMutableString string];
    NSArray *components = [name.lowercaseString componentsSeparatedByString:@" "];
    NSUInteger count = components.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        if(i)
        {
            [mut appendString:@" "];
        }
        
        NSString *component = components[i];
        
        if([component isEqualToString:@"uam"])
        {
            component = component.uppercaseString;
        }
        else if(![component isEqualToString:@"de"])
        {
            NSString *pre = [[component substringToIndex:1] uppercaseString];
            NSString *post;
            
            if(component.length > 1)
            {
                post = [component substringFromIndex:1];
            }
            
            if(post)
            {
                component = [NSString stringWithFormat:@"%@%@", pre, post];
            }
            else
            {
                component = pre;
            }
        }
        
        [mut appendString:component];
    }
    
    self.name = mut;
    
    return self;
}

@end