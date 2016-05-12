#import "mpollutionfront.h"

@interface mpollutionfront ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionfrontitem*> *items;

@end

@implementation mpollutionfront

-(instancetype)init:(mpollution*)model
{
    self = [super init];
    
    NSMutableArray<mpollutionfrontitem*> *items = [NSMutableArray array];
    mpollutionfrontitem *globalitem;
    
    if(model.modelhourly.count)
    {
        mpollutionhour *currenthour = model.modelhourly.lastObject;
        globalitem = [mpollutionfrontitem global:currenthour.pollution.integerValue];
    }
    else
    {
        globalitem = [mpollutionfrontitem global:0];
    }
    
    [items addObject:globalitem];
    
    NSUInteger countdistritcs = model.modeldistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = model.modeldistricts[indexdistricts];
        mpollutionfrontitem *item = [mpollutionfrontitem district:district];
        
        [items addObject:item];
    }
    
    self.items = items;
    
    return self;
}

#pragma mark public

-(void)highlight:(mpollutionfrontitem*)model
{
    BOOL makestandby = model.spatial;
    
    for(mpollutionfrontitem *item in self.items)
    {
        if(makestandby)
        {
            [item standby];
        }
        else
        {
            if(item == model)
            {
                [item turnon];
            }
            else
            {
                [item turnoff];
            }
        }
    }
}

@end