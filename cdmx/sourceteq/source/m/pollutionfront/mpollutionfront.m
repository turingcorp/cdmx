#import "mpollutionfront.h"

@interface mpollutionfront ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionitem*> *items;

@end

@implementation mpollutionfront

-(instancetype)init:(mpollution*)model
{
    self = [super init];
    
    NSMutableArray<mpollutionitem*> *items = [NSMutableArray array];
    mpollutionitem *globalitem;
    
    if(model.modelhourly.count)
    {
        mpollutionhour *currenthour = [model.modelhourly lastObject];
        globalitem = [mpollutionitem pollutionglobal:currenthour.pollution];
    }
    else
    {
        globalitem = [mpollutionitem pollutionglobalempty];
    }
    
    [items addObject:globalitem];
    
    NSUInteger countdistritcs = model.modeldistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = model.modeldistricts[indexdistricts];
        mpollutionitem *modeldistrict = [mpollutionitem district:district];
        
        [items addObject:modeldistrict];
    }
    
    self.items = items;
    
    return self;
}

#pragma mark public

-(void)highlight:(mpollutionitem*)model
{
    BOOL makestandby = model.makesstandby;
    
    for(mpollutionitem *item in self.items)
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