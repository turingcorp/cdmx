#import "mpollutionfront.h"
#import "genericconstants.h"

@interface mpollutionfront ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionfrontitem*> *items;

@end

@implementation mpollutionfront

-(instancetype)init:(mpollution*)model
{
    self = [super init:model];
    
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
    
    globalitem.parent = self;
    [items addObject:globalitem];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_mapwidth;
    CGFloat marginx = remainwidth / 2.0;
    
    NSUInteger countdistritcs = model.modeldistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistritcs; indexdistricts++)
    {
        mdbdistrict *district = model.modeldistricts[indexdistricts];
        mpollutionfrontitem *item = [mpollutionfrontitem district:district marginx:marginx];
        item.parent = self;
        [items addObject:item];
    }
    
    self.items = items;
    
    return self;
}

#pragma mark public

-(void)highlight:(mpollutionfrontitem*)model
{
    BOOL makestandby = YES;
    
    if(model.spatial)
    {
        makestandby = NO;
    }
    
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

#pragma mark -
#pragma mark option

-(void)clean
{
    for(mpollutionfrontitem *item in self.items)
    {
        item.spatial.color = GLKVector4Make(0, 0, 0, 0);
    }
}

@end