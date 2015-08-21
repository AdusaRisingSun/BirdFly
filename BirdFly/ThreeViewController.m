//
//  ThreeViewController.m
//  BirdFly
//
//  Created by Adusa on 15/8/18.
//  Copyright © 2015年 Adusa. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blueColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    label.text=@"i am three";
    [self.view addSubview:label];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;UIView *view=[[UIView alloc]init];
    view.frame=CGRectMake(0, 0, SCREENWIDTH, 100);
    view.backgroundColor=[UIColor blackColor];
    UIView *view1=[[UIView alloc]init];
    view1.frame=CGRectMake(0, 0, SCREENWIDTH, 100);
    view1.backgroundColor=[UIColor purpleColor];
    _tableView.tableHeaderView=view;
    _tableView.tableFooterView=view1;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
static NSString *cellName=@"cell";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    if (indexPath.section==0) {
        cell.backgroundColor=[UIColor yellowColor];
    }
    else
    cell.backgroundColor=[UIColor greenColor];
    
    cell.accessoryType=UITableViewCellAccessoryDetailButton;
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    cell.textLabel.text=@"icon";
    cell.detailTextLabel.text=@"image";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section：%ld  row：%ld",(long)indexPath.section,(long)indexPath.row);
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
        return @"Section - 0";
    else
        return @"Section - 1";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section==0)
        return @"Section - 0  foot";
    else
        return @"Section - 1  foot";
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
