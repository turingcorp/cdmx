#import <Foundation/Foundation.h>
#import "gspatialtexture.h"
#import "mdbdistrict.h"

@interface gpollutiondist:gspatialtexture

-(instancetype)init:(mdbdistrict*)model;
-(void)minsize;
-(void)maxsize;

@property(assign, nonatomic)CGFloat standx;
@property(assign, nonatomic)CGFloat standy;
@property(assign, nonatomic)CGFloat highlightx;
@property(assign, nonatomic)CGFloat highlighty;
@property(assign, nonatomic)CGFloat minwidth;
@property(assign, nonatomic)CGFloat minheight;
@property(assign, nonatomic)CGFloat maxwidth;
@property(assign, nonatomic)CGFloat maxheight;

@end