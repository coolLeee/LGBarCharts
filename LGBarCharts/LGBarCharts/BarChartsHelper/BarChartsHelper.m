//
//  BarChartsHeloper.m
//  sanbanhuiHelper
//
//  Created by WorkMac on 2017/4/4.
//  Copyright © 2017年 BeijingKaiFengData. All rights reserved.
//

#import "BarChartsHelper.h"

@implementation BarChartsHelper

//单柱
- (void)setBarChart:(BarChartView *)barChart xValues:(NSArray *)xValues yValues:(NSArray *)yValues barTitle:(NSString *)bar
{
    barChart.noDataText = @"暂无数据";//没有数据时的文字提示
    barChart.drawValueAboveBarEnabled = YES;//数值显示在柱形的上面还是下面
    //   barChart.drawh = NO;//点击柱形图是否显示箭头
    barChart.drawBarShadowEnabled = NO;//是否绘制柱形的阴影背景
    barChart.drawBordersEnabled = NO;
//    barChart.borderColor = [UIColor colorWithRGBHex:0xaaaaaa];
    //2.barChartView的交互设置
    barChart.scaleYEnabled = NO;//取消Y轴缩放
    barChart.doubleTapToZoomEnabled = NO;//取消双击缩放
    barChart.dragEnabled = YES;//启用拖拽图表
    barChart.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    barChart.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    
    [barChart setDescriptionText:@""];
    barChart.drawGridBackgroundEnabled = YES;
    barChart.gridBackgroundColor = [UIColor whiteColor];
    barChart.userInteractionEnabled = NO;
    
    barChart.marker = [[ChartMarkerView alloc] init];
    
    //X轴设置
    ChartXAxis *xAxis = barChart.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xValues];
    xAxis.labelFont = [UIFont systemFontOfSize:10];
    xAxis.labelCount = xValues.count;
    xAxis.labelRotationAngle = -40;
    xAxis.yOffset = 10;
    xAxis.drawAxisLineEnabled = YES;
    //Y轴设置
    ChartYAxis *leftAxis = barChart.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.drawGridLinesEnabled = YES;
    
    barChart.rightAxis.enabled = NO;
    
    //设置图例
    ChartLegend *legend = barChart.legend;
    
    legend.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    legend.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    legend.orientation = ChartLegendOrientationHorizontal;
    legend.drawInside = YES;
    legend.direction = ChartLegendDirectionLeftToRight;
    legend.form = ChartLegendFormSquare;
    legend.formSize = 10;
    legend.font = [UIFont systemFontOfSize:10];
    legend.textColor = [UIColor colorWithRGBHex:0x595959];
    legend.xOffset = -15;
    
    barChart.extraBottomOffset = 30;
    barChart.extraTopOffset = 30;
    barChart.fitBars = YES;
    
    BarChartData *data = [self generateBarChartData:yValues title:bar barColor:[UIColor colorWithRGBHex:0xa09be7]];
    
    barChart.data = data;
    xAxis.axisMinimum = data.xMin - 0.7f;
    xAxis.axisMaximum = data.xMax + 0.7f;
    //Y轴动画
    [barChart animateWithYAxisDuration:1.0];
}
- (BarChartData *)generateBarChartData:(NSArray *)yValues title:(NSString *)title barColor:(UIColor *)barColor
{
    NSMutableArray *entries = [NSMutableArray array];
    for (int i =0; i<yValues.count; i++) {
        BarChartDataEntry *barEntry = [[BarChartDataEntry alloc] initWithX:i y:[yValues[i] doubleValue]];
        [entries addObject:barEntry];
    }
    BarChartDataSet *set2 = [[BarChartDataSet alloc] initWithValues:entries label:title];
    set2.drawValuesEnabled = YES;//是否在柱形图上面显示数值
    set2.highlightEnabled = NO;//点击选中柱形图是否有高亮效果，（双击空白处取消选中）
    set2.colors = @[barColor];

    BarChartData *data = [[BarChartData alloc] initWithDataSet:set2];
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    //自定义数据显示格式
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setPositiveFormat:@"#0.00"];
    ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numFormatter];
    [data setValueFormatter:formatter];
    [data setValueFont:[UIFont systemFontOfSize:10]];
    [data setValueTextColor:[UIColor colorWithRGBHex:0x838383]];
    return data;
}

//单柱和折线组合
- (void)setBarChart:(CombinedChartView *)combineChart lineValues:(NSArray *)lineValues xValues:(NSArray *)xValues yValues:(NSArray *)yValues lineTitle:(NSString *)lineTitle barTitle:(NSString *)barTitle
{
    combineChart.descriptionText = @"";
    combineChart.pinchZoomEnabled = NO;
    combineChart.marker = [[ChartMarkerView alloc] init];
    combineChart.drawOrder = @[@0,@0,@2];//设置绘制顺序CombinedChartDrawOrderBar,CombinedChartDrawOrderLine
    combineChart.doubleTapToZoomEnabled = NO;//取消双击放大
    combineChart.scaleYEnabled = NO;
    combineChart.dragEnabled = YES;//启用拖拽图表
    combineChart.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    combineChart.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    combineChart.drawValueAboveBarEnabled = YES;
    combineChart.highlightPerTapEnabled = NO;//取消单击高亮显示
    combineChart.highlightPerDragEnabled = NO;
    combineChart.drawGridBackgroundEnabled = YES;
    combineChart.gridBackgroundColor = [UIColor whiteColor];
    combineChart.drawBordersEnabled = NO;
    combineChart.userInteractionEnabled = NO;
    combineChart.rightAxis.enabled = NO;
    
    //X轴设置
    ChartXAxis *xAxis = combineChart.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xValues];
    xAxis.labelFont = [UIFont systemFontOfSize:10];
    xAxis.labelCount = xValues.count;
    xAxis.labelRotationAngle = -40;
    xAxis.yOffset = 10;
    xAxis.drawAxisLineEnabled = YES;
    //左侧Y轴设置
    ChartYAxis *leftAxis = combineChart.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.drawGridLinesEnabled = YES;
    
//    float yMin = [[yValues valueForKeyPath:@"@min.floatValue"] floatValue];
//    float yMax = [[yValues valueForKeyPath:@"@max.floatValue"] floatValue];
//    if (yMin<0) {
//        yMin = yMin*1.3;
//    }else
//        yMin = yMin*0.8;
//    
//    if (yMax>=0) {
//        yMax = yMax*1.3;
//    }else
//        yMax = 0;
//    leftAxis.axisMinimum = yMin;
//    leftAxis.axisMaximum = yMax;
    
    //右侧Y轴
//    ChartYAxis *rightAxis = combineChart.rightAxis;
//    rightAxis.labelPosition = YAxisLabelPositionOutsideChart;
//    rightAxis.drawGridLinesEnabled = NO;
//    float y1Min = [[lineValues valueForKeyPath:@"@min.floatValue"] floatValue];
//    float y1Max = [[lineValues valueForKeyPath:@"@max.floatValue"] floatValue];
//    if (y1Min<0) {
//        y1Min = y1Min*1.3;
//    }else
//        y1Min = y1Min*0.8;
//    
//    if (y1Max>=0) {
//        y1Max = y1Max*1.3;
//    }else
//        y1Max = 0;
//    rightAxis.axisMinimum = y1Min;
//    rightAxis.axisMaximum = y1Max;
//    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
//    //自定义数据显示格式
//    [numFormatter setNumberStyle:NSNumberFormatterPercentStyle];
//    [numFormatter setPositiveFormat:@"#%/100"];
//    
//    ChartDefaultAxisValueFormatter *formatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:numFormatter];
//    rightAxis.valueFormatter = formatter;
    //设置图例
    ChartLegend *legend = combineChart.legend;
    legend.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    legend.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    legend.orientation = ChartLegendOrientationHorizontal;
    legend.drawInside = YES;
    legend.direction = ChartLegendDirectionLeftToRight;
    legend.form = ChartLegendFormSquare;
    legend.formSize = 10;
    legend.font = [UIFont systemFontOfSize:10];
    legend.textColor = [UIColor colorWithRGBHex:0x595959];
    legend.xOffset = -15;
    
    CombinedChartData *data = [[CombinedChartData alloc] init];
    data.lineData = [self generateLineData:lineValues lineTitle:lineTitle lineColor:[UIColor colorWithRGBHex:0xffc12d]];
    
    data.barData = [self generateBarChartData:yValues title:barTitle barColor:[UIColor colorWithRGBHex:0xa09be7]];
    combineChart.data = data;
    
    xAxis.axisMinimum = data.xMin - 0.7f;
    xAxis.axisMaximum = data.xMax + 0.7f;
    combineChart.extraBottomOffset = 30;
    combineChart.extraTopOffset = 30;
    [combineChart animateWithYAxisDuration:1.0];
}

//双柱和折线组合
- (void)setCombineBarChart:(CombinedChartView *)combineChart xValues:(NSArray *)xValues lineValues:(NSArray *)lineValues bar1Values:(NSArray *)bar1Values bar2Values:(NSArray *)bar2Values lineTitle:(NSString *)lineTitle bar1Title:(NSString *)bar1Title bar2Title:(NSString *)bar2Title
{
    combineChart.descriptionText = @"";
    combineChart.pinchZoomEnabled = NO;
    combineChart.marker = [[ChartMarkerView alloc] init];
    combineChart.drawOrder = @[@0,@0,@2];//CombinedChartDrawOrderBar,CombinedChartDrawOrderLine
    combineChart.doubleTapToZoomEnabled = NO;//取消双击放大
    combineChart.scaleYEnabled = NO;
    combineChart.dragEnabled = YES;//启用拖拽图表
    combineChart.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    combineChart.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    combineChart.drawValueAboveBarEnabled = YES;
    combineChart.highlightPerTapEnabled = NO;//取消单击高亮显示
    combineChart.highlightPerDragEnabled = NO;
    combineChart.drawGridBackgroundEnabled = YES;
    combineChart.gridBackgroundColor = [UIColor whiteColor];
    combineChart.drawBordersEnabled = NO;//添加边框
    combineChart.userInteractionEnabled = NO;
    
    ChartXAxis *xAxis = combineChart.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.labelFont = [UIFont systemFontOfSize:10];
    xAxis.labelCount = xValues.count;
    xAxis.labelRotationAngle = -40;
    xAxis.yOffset = 10;
    xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xValues];
    xAxis.drawAxisLineEnabled = YES;
    //左侧Y轴设置
    ChartYAxis *leftAxis = combineChart.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.axisMinimum = 0.0f;
    leftAxis.drawGridLinesEnabled = YES;
    
//    float yMin = [[bar2Values valueForKeyPath:@"@min.floatValue"] floatValue];
//    float yMax = [[bar1Values valueForKeyPath:@"@max.floatValue"] floatValue];
//    if (yMin<0) {
//        yMin = yMin*1.3;
//    }else
//        yMin = yMin*0.8;
//    
//    if (yMax>=0) {
//        yMax = yMax*1.3;
//    }else
//        yMax = 0;
//    leftAxis.axisMinimum = yMin;
//    leftAxis.axisMaximum = yMax;

    //右侧Y轴
    ChartYAxis *rightAxis = combineChart.rightAxis;
    rightAxis.labelPosition = YAxisLabelPositionOutsideChart;
    rightAxis.drawGridLinesEnabled = NO;
    float y1Min = [[lineValues valueForKeyPath:@"@min.floatValue"] floatValue];
    float y1Max = [[lineValues valueForKeyPath:@"@max.floatValue"] floatValue];
    if (y1Min<0) {
        y1Min = y1Min*1.3;
    }else
        y1Min = 0;
    
    if (y1Max>=0) {
        y1Max = y1Max*1.3;
    }else
        y1Max = 0;
    
    rightAxis.axisMinimum = y1Min;
    rightAxis.axisMaximum = y1Max;
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    //自定义数据显示格式
    [numFormatter setNumberStyle:NSNumberFormatterPercentStyle];
    [numFormatter setPositiveFormat:@"#%/100"];
    
    ChartDefaultAxisValueFormatter *formatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:numFormatter];
    rightAxis.valueFormatter = formatter;
    
    //设置图例
    ChartLegend *legend = combineChart.legend;
    legend.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    legend.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    legend.orientation = ChartLegendOrientationHorizontal;
    legend.drawInside = YES;
    legend.direction = ChartLegendDirectionLeftToRight;
    legend.form = ChartLegendFormSquare;
    legend.formSize = 10;
    legend.font = [UIFont systemFontOfSize:10];
    legend.textColor = [UIColor colorWithRGBHex:0x595959];
//    legend.xOffset = -15;
    
    CombinedChartData *data = [[CombinedChartData alloc] init];
    data.lineData = [self generateLineData:lineValues lineTitle:lineTitle lineColor:[UIColor colorWithRGBHex:0xffc12d]];
    data.barData = [self generateCombineBarData:bar1Values bar2Values:bar2Values title1:bar1Title title2:bar2Title];
    combineChart.data = data;
    
    
    
    xAxis.axisMinimum = data.xMin - 0.7f;
    xAxis.axisMaximum = data.xMax + 0.7f;
    combineChart.extraBottomOffset = 50;
    combineChart.extraTopOffset = 30;
    [combineChart animateWithYAxisDuration:1.0];
}
//生成线的数据
- (LineChartData *)generateLineData:(NSArray *)lineValues lineTitle:(NSString *)lineTitle lineColor:(UIColor *)color
{
    NSMutableArray *entries = [NSMutableArray array];
    for (int i = 0; i < lineValues.count; i++) {
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:[lineValues[i] floatValue]];
        [entries addObject:entry];
    }
    
    LineChartDataSet *dataSet = [[LineChartDataSet alloc] initWithValues:entries label:lineTitle];
    dataSet.colors = @[color];
    dataSet.lineWidth = 1.5f;
    dataSet.circleColors = @[[UIColor colorWithRGBHex:0xffc12d]];
    dataSet.circleHoleColor = [UIColor colorWithRGBHex:0xffc12d];
    dataSet.circleRadius = 3.0;
    dataSet.drawCirclesEnabled = YES;
    dataSet.drawCircleHoleEnabled = YES;
    dataSet.axisDependency = AxisDependencyRight;
    dataSet.drawValuesEnabled = NO;//不绘制线的数据
    
    LineChartData *lineData = [[LineChartData alloc] initWithDataSet:dataSet];
    [lineData setValueFont:[UIFont systemFontOfSize:10]];
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    //自定义数据显示格式
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setPositiveFormat:@"#0.00"];
    ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numFormatter];
    [lineData setValueFormatter:formatter];
    return lineData;
}
//生成复杂的组合柱图的数据
- (BarChartData *)generateCombineBarData:(NSArray *)bar1Values bar2Values:(NSArray *)bar2Values title1:(NSString *)bar1Title title2:(NSString *)bar2Title
{
    NSMutableArray *bar1Entries = [NSMutableArray array];
    NSMutableArray *bar2Entries = [NSMutableArray array];
    for (int i=0; i<bar1Values.count; i++) {
        BarChartDataEntry *barEntry = [[BarChartDataEntry alloc] initWithX:i y:[bar1Values[i] floatValue]];
        [bar1Entries addObject:barEntry];
    }
    for (int i=0; i<bar2Values.count; i++) {
        BarChartDataEntry *barEntry = [[BarChartDataEntry alloc] initWithX:i y:[bar2Values[i] floatValue]];
        [bar2Entries addObject:barEntry];
    }
    
    BarChartDataSet *dataSet1 = [[BarChartDataSet alloc]  initWithValues:bar1Entries label:bar1Title];
    dataSet1.colors = @[[UIColor colorWithRGBHex:0xc0b8f2]];
    dataSet1.axisDependency = AxisDependencyLeft;
    dataSet1.drawValuesEnabled = YES;
    
    BarChartDataSet *dataSet2 = [[BarChartDataSet alloc]  initWithValues:bar2Entries label:bar2Title];
    dataSet2.colors = @[[UIColor colorWithRGBHex:0xa09be7]];
    dataSet2.axisDependency = AxisDependencyLeft;
    dataSet2.drawValuesEnabled = NO;
    BarChartData *data = [[BarChartData alloc] initWithDataSets:@[dataSet1,dataSet2]];
    [data setValueFont:[UIFont systemFontOfSize:10]];
    [data setValueTextColor:[UIColor colorWithRGBHex:0x838383]];
    data.barWidth = 0.9f;
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    //自定义数据显示格式
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setPositiveFormat:@"#0.00"];
    ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numFormatter];
    [data setValueFormatter:formatter];
    return data;
}

@end
