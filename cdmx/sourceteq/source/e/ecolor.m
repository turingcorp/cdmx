#import "ecolor.h"

@implementation UIColor (ecolor)

+(instancetype)main
{
    return [UIColor colorWithRed:0.28235 green:0.49019 blue:0.76078 alpha:1];
}

+(instancetype)second
{
    return [UIColor colorWithRed:0.6 green:0.8 blue:0 alpha:1];
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
    return [UIColor colorWithRed:0.97 green:0.96 blue:0.1 alpha:1];
}

+(instancetype)pollution_orange
{
    return [UIColor colorWithRed:1 green:0.7 blue:0 alpha:1];
}

+(instancetype)pollution_red
{
    return [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
}

+(instancetype)pollution_violet
{
    return [UIColor colorWithRed:0.8 green:0.5 blue:0.7 alpha:1];
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

@end