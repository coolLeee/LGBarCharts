//
//  ViewController.m
//  LGBarCharts
//
//  Created by WorkMac on 2017/7/10.
//  Copyright © 2017年 BeijingKaiFengData. All rights reserved.
//

#import "ViewController.h"
#import "LGDemoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"柱图";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
    LGDemoViewController *demoVC = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"segue1"]) {
        demoVC.type = @"type1";
    }else if ([segue.identifier isEqualToString:@"segue2"])
    {
        demoVC.type = @"type2";
    }else
    {
        demoVC.type = @"type3";
    }
}


@end
