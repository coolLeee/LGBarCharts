//
//  BarChartsHeloper.h
//  sanbanhuiHelper
//
//  Created by WorkMac on 2017/4/4.
//  Copyright © 2017年 BeijingKaiFengData. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+KFColorHelper.h"
#import "LGBarCharts-Bridging-Header.h"


@interface BarChartsHelper : NSObject


/**
 单个柱子的显示
 
 @param barChart 需要设置的BarChartView
 @param xValues X轴的值数组
 @param yValues 每个柱子的值数组
 @param bar 柱子的含义
 */
- (void)setBarChart:(BarChartView *)barChart xValues:(NSArray *)xValues yValues:(NSArray *)yValues barTitle:(NSString *)bar;


/**
 折线和单柱的显示
 
 @param combineChart 需要设置的BarChartView
 @param lineValues 折线图的值
 @param xValues X轴的值数组
 @param yValues 每个柱子的值数组
 @param lineTitle 折线的含义
 @param barTitle 柱子的含义
 */
- (void)setBarChart:(CombinedChartView *)combineChart lineValues:(NSArray *)lineValues xValues:(NSArray *)xValues yValues:(NSArray *)yValues lineTitle:(NSString *)lineTitle barTitle:(NSString *)barTitle;

/**
 两根柱子以及折线的混合显示

 @param combineChart 需要设置的CombineChartView
 @param xValues X轴的值数组，里面放字符串
 @param lineValues 折线值数组
 @param bar1Values 柱子1的值数组
 @param bar2Values 柱子2的值数组
 @param lineTitle 图例中折线的描述
 @param bar1Title 图例中柱子1的描述
 @param bar2Title 图例中柱子2的描述
 
 warning:由于绘制有顺序，所以绘制高柱子应该在绘制低柱子之前进行，所以bar1Values中的值要大于对应的bar2Values中的值，绘制折线应该在最后进行
 */
- (void)setCombineBarChart:(CombinedChartView *)combineChart xValues:(NSArray *)xValues lineValues:(NSArray *)lineValues bar1Values:(NSArray *)bar1Values bar2Values:(NSArray *)bar2Values lineTitle:(NSString *)lineTitle bar1Title:(NSString *)bar1Title bar2Title:(NSString *)bar2Title;
@end
