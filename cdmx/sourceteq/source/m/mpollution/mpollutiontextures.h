#import <Foundation/Foundation.h>
#import "mpollutiontexturesitem.h"
#import "mpollutiontexturesitembenitojuarez.h"

@interface mpollutiontextures:NSObject

@property(strong, nonatomic)NSArray<mpollutiontexturesitem*> *items;
@property(weak, nonatomic)mpollutiontexturesitembenitojuarez *itembenitojuarez;

@end