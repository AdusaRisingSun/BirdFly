//
//  OneViewController.m
//  BirdFly
//
//  Created by Adusa on 15/8/18.
//  Copyright © 2015年 Adusa. All rights reserved.
//

#import "OneViewController.h"
#import "One1ViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor yellowColor];
    UIBarButtonItem *nextbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonClicked:)];
    self.navigationItem.rightBarButtonItem=nextbutton;
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    label.text=@"i am one";
    [self.view addSubview:label];
}

-(void)editButtonClicked:(UIBarButtonItem *)item
{
    One1ViewController *one1=[[One1ViewController alloc]init];
    [self.navigationController pushViewController:one1 animated:YES];
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
