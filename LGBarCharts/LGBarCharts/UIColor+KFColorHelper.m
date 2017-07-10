//
//  UIColor+KFColorHelper.m
//  sanbanhuiHelper
//
//  Created by WorkMac on 16/12/29.
//  Copyright © 2016年 BeijingKaiFengData. All rights reserved.
//

#import "UIColor+KFColorHelper.h"

@implementation UIColor (KFColorHelper)

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

@end
