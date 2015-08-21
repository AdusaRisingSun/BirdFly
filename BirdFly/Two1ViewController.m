//
//  Two1ViewController.m
//  BirdFly
//
//  Created by Adusa on 15/8/18.
//  Copyright © 2015年 Adusa. All rights reserved.
//

#import "Two1ViewController.h"

@interface Two1ViewController ()

@end

@implementation Two1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    label.text=@"i am two1";
    [self.view addSubview:label];
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
