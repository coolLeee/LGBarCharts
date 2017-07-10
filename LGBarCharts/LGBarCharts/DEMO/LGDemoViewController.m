//
//  LGDemoViewController.m
//  LGBarCharts
//
//  Created by WorkMac on 2017/7/10.
//  Copyright © 2017年 BeijingKaiFengData. All rights reserved.
//

#import "LGDemoViewController.h"
#import "LGBarCharts-Bridging-Header.h"
#import "BarChartsHelper.h"

@interface LGDemoViewController ()
@property (nonatomic, weak) BarChartView *barChartView;
@property (nonatomic, weak) CombinedChartView *combineChartView1;
@property (nonatomic, weak) CombinedChartView *combineChartView2;
@end

@implementation LGDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([self.type isEqualToString:@"type1"]) {
        [self createSingleBarChartViewWithXvals:@[@"15",@"20",@"25",@"30",@"35"] yVals:@[@"30",@"60",@"100",@"40",@"70"] title:@"单柱图" barTitle:@"type1"];
    }else if ([self.type isEqualToString:@"type2"])
    {
        [self createCombineChartViewWithLineValues:@[@"46",@"29",@"30",@"70",@"10"] xValues:@[@"15",@"20",@"25",@"30",@"35"] yValues:@[@"35",@"20",@"75",@"30",@"95"] title:@"单柱和折线图" lineTitle:@"line" barTitle:@"type2" index:0];
    }else
    {
        [self createCombineBarChartViewWithXValues:@[@"15",@"20",@"25",@"30",@"35"] lineValues:@[@"46",@"29",@"30",@"70",@"10"] bar1Vals:@[@"15",@"30",@"45",@"80",@"45"] bar2Vals:@[@"10",@"20",@"30",@"30",@"35"] title:@"多柱和折线图" lineTitle:@"line" bar1Title:@"bar1" bar2Title:@"bar2"];
    }
}

//单柱图
- (void)createSingleBarChartViewWithXvals:(NSArray *)xVals yVals:(NSArray *)yVals title:(NSString *)title barTitle:(NSString *)bar
{
    BarChartView *barChartView = [[BarChartView alloc] init];
    self.barChartView = barChartView;
    //    self.barChartView.delegate = self;//设置代理 可以设置X轴和Y轴的格式
    self.barChartView.frame = CGRectMake(0, 200, self.view.frame.size.width, 400);
    [self.view addSubview:self.barChartView];
    
    //添加图表标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake((self.view.frame.size.width-100)/2, 150, 100, 30);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor colorWithRGBHex:0x595959];
    [self.view addSubview:titleLabel];
    
    BarChartsHelper *helper = [[BarChartsHelper alloc] init];
    [helper setBarChart:self.barChartView xValues:xVals yValues:yVals barTitle:bar];
}

//柱和折线图
- (void)createCombineChartViewWithLineValues:(NSArray *)lineVals xValues:(NSArray *)xVals yValues:(NSArray *)yVals title:(NSString *)title lineTitle:(NSString *)line barTitle:(NSString *)bar index:(NSInteger)index
{
    CombinedChartView *combine = [[CombinedChartView alloc] init];
    self.combineChartView1 = combine;
    self.combineChartView1.frame = CGRectMake(0, 200, self.view.frame.size.width, 400);
    [self.view addSubview:combine];
    
    //添加图表标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake((self.view.frame.size.width-100)/2, 150, 100, 30);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor colorWithRGBHex:0x595959];
    [self.view addSubview:titleLabel];
    BarChartsHelper *helper = [[BarChartsHelper alloc] init];
    [helper setBarChart:combine lineValues:lineVals xValues:xVals yValues:yVals lineTitle:line barTitle:bar];
}
//双柱折线图
- (void)createCombineBarChartViewWithXValues:(NSArray *)xVals lineValues:(NSArray *)lineVals  bar1Vals:(NSArray *)bar1Vals bar2Vals:(NSArray *)bar2Vals title:(NSString *)title lineTitle:(NSString *)line bar1Title:(NSString *)bar1 bar2Title:(NSString *)bar2
{
    
    CombinedChartView *combine = [[CombinedChartView alloc] init];
    self.combineChartView2 = combine;
    self.combineChartView2.frame = CGRectMake(0, 200, self.view.frame.size.width, 400);
    [self.view addSubview:combine];
    
    //添加图表标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake((self.view.frame.size.width-100)/2, 150, 100, 30);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor colorWithRGBHex:0x595959];
    [self.view addSubview:titleLabel];
    
    BarChartsHelper *helper = [[BarChartsHelper alloc] init];
    [helper setCombineBarChart:self.combineChartView2 xValues:xVals lineValues:lineVals bar1Values:bar1Vals bar2Values:bar2Vals lineTitle:line bar1Title:bar1 bar2Title:bar2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
