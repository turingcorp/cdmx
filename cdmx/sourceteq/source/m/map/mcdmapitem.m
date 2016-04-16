#import "mcdmapitem.h"
#import "mstations.h"

@implementation mcdmapitem

-(instancetype)init:(NSString*)shortname
{
    self = [super init];
    self.lookshortname = shortname;
    [self findstation];
    
    return self;
}

#pragma mark functionality

-(void)findstation
{
    NSArray<mstationsreadingitem*> *items = [[mstations singleton].readings lastObject].items;

    for(mstationsreadingitem *item in items)
    {
        if([item.shortname isEqualToString:self.lookshortname])
        {
            self.readingmodel = item;
            
            break;
        }
    }
}

@end