#import <UIKit/UIKit.h>

@class cmenu;

@interface vmenubar:UIView

-(instancetype)init:(cmenu*)controller;

@property(weak, nonatomic)cmenu *controller;

@end