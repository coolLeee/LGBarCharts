//
//  UIColor+KFColorHelper.h
//  sanbanhuiHelper
//
//  Created by WorkMac on 16/12/29.
//  Copyright © 2016年 BeijingKaiFengData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KFColorHelper)

//RGB转成颜色  #ff0000
+ (UIColor *)colorWithRGBHex:(UInt32)hex; 

@end
