//
//  TwoViewController.m
//  BirdFly
//
//  Created by Adusa on 15/8/18.
//  Copyright © 2015年 Adusa. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    label.text=@"i am two";
    [self.view addSubview:label];
    [self buildScrollView];
}

-(void)buildScrollView
{
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH,SCREENHEIGHT )];
    _scrollView.contentSize=CGSizeMake(11*SCREENWIDTH, SCREENHEIGHT);
    NSArray *imageArray=[NSArray arrayWithObjects:@"0.jpeg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpeg",@"6.jpeg",@"7.jpeg",@"8.jpeg",@"9.jpeg",@"10.jpeg", nil];
    for (int i=0; i<11; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
        imageView.frame=CGRectMake(i*SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT);
        [_scrollView addSubview:imageView];
    }
    _scrollView.delegate=self;
    _scrollView.bounces=NO;
    _scrollView.pagingEnabled=YES;
    _scrollView.maximumZoomScale = 3.0f;
    _scrollView.minimumZoomScale = 1.0f;
    [self.view addSubview:_scrollView];

}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return nil;
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
