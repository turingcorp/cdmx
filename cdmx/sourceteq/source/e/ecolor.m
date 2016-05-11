#import "ecolor.h"

@implementation UIColor (ecolor)

+(instancetype)main
{
    return [UIColor colorWithRed:0.352941 green:0.541176 blue:0.784313 alpha:1];
}

+(instancetype)second
{
    return [UIColor colorWithRed:0.74 green:0.9 blue:0 alpha:1];
}

+(instancetype)background
{
    return [UIColor colorWithRed:0.92 green:0.94 blue:0.97 alpha:1];
}

+(instancetype)pollution_green
{
    return [UIColor colorWithRed:0.5 green:0.9 blue:0 alpha:1];
}

+(instancetype)pollution_yellow
{
    return [UIColor colorWithRed:0.92 green:0.87 blue:0 alpha:1];
}

+(instancetype)pollution_orange
{
    return [UIColor colorWithRed:1 green:0.6 blue:0 alpha:1];
}

+(instancetype)pollution_red
{
    return [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
}

+(instancetype)pollution_violet
{
    return [UIColor colorWithRed:0.9 green:0.5 blue:0.8 alpha:1];
}

+(instancetype)pollution_pink
{
    return [UIColor colorWithRed:0.95 green:0.65 blue:0.7 alpha:1];
}

+(instancetype)pollution_blue
{
    return [UIColor colorWithRed:0.5 green:0.8 blue:0.97 alpha:1];
}

+(instancetype)pollution_gray
{
    return [UIColor colorWithWhite:0.9 alpha:1];
}

-(GLKVector4)asvector
{
    GLKVector4 vector;
    CGFloat redcomponent;
    CGFloat greencomponent;
    CGFloat bluecomponent;
    CGFloat alphacomponent;
    [self getRed:&redcomponent green:&greencomponent blue:&bluecomponent alpha:&alphacomponent];
    vector = GLKVector4Make(redcomponent * alphacomponent, greencomponent * alphacomponent, bluecomponent * alphacomponent, alphacomponent);
    
    return vector;
}

@end