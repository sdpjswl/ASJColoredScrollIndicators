//
//  UIColor+Radiohead.m
//  ASJColoredScrollIndicatorsExample
//
//  Created by ABS_MAC02 on 13/05/16.
//  Copyright © 2016 sudeep. All rights reserved.
//

#import "UIColor+Radiohead.h"

@implementation UIColor (Radiohead)

+ (UIColor *)trueLoveWaitsBackgroundColor
{
    return [UIColor colorWithR:255.0f g:0.0f b:128.0f a:0.1f];
}

+ (UIColor *)trueLoveWaitsIndicatorColor
{
    return [UIColor colorWithR:255.0f g:0.0f b:128.0f a:1.0f];
}

+ (UIColor *)okComputerTableBackgroundColor
{
    return [UIColor colorWithR:241.0f g:242.0f b:245.0f a:0.1f];
}

+ (UIColor *)okComputerIndicatorColor
{
    return [UIColor colorWithR:80.0f g:109.0f b:132.0f a:1.0f];
}

+ (UIColor *)inRainbowsTableBackgroundColor
{
    return [UIColor colorWithWhite:0.2f alpha:1.0f];
}

+ (UIColor *)inRainbowsIndicatorColor
{
    return [UIColor orangeColor];
}

+ (UIColor *)radioheadAlbumsBackgroundColor
{
    return [UIColor colorWithR:35.0f g:43.0f b:8.0f a:0.1f];
}

+ (UIColor *)radioheadAlbumsIndicatorColor
{
    return [UIColor colorWithR:0.0f g:122.0f b:255.0f a:1.0f];
    return [UIColor colorWithR:35.0f g:90.0f b:8.0f a:1.0f];
}

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a
{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

@end
