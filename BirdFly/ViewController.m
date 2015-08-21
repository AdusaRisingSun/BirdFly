//
//  ViewController.m
//  BirdFly
//
//  Created by Adusa on 15/8/18.
//  Copyright © 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "Two1ViewController.h"
#import "ThreeViewController.h"
#import "Three1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    //定时器对象
    NSTimer *timer;
    UIImageView *bird;
    TwoViewController*two;
    ThreeViewController *three;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    //UIImageView图像视图的使用
    //需求：界面上显示背景
    //解决：可以是用UIImage
    UIImageView *backView=[[UIImageView alloc]init];
    //设置位置和大小
    backView.frame=CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    backView.image=[UIImage imageNamed:@"20141206012146_vVUCm.jpeg"];
    [self.view addSubview:backView];

    //天空上添加一只鸟
    bird=[[UIImageView alloc]init];
    bird.frame=CGRectMake(10, 300, 121, 96);
    bird.image=[UIImage imageNamed:@"DOVE 1.png"];
    [self.view addSubview:bird];
    
    
    //问题？
    //1.鸟要飞行
    //使用UIImageView的动画
    //2.鸟在飞行的过程中移动
    //NSTimer定时器不断改变鸟的位置
    //先要实现动画 要先设置这三个属性
    //    bird.animationImages  构成动画效果的图片数组
    //    bird.animationDuration  每轮动画的持续时间
    //    bird.animationRepeatCount  动画重复的次数
    bird.animationDuration=0.6;
    NSMutableArray *imageArray=[[NSMutableArray alloc]init];
    for (int i=1; i<=18; i++) {
        NSString *file=[NSString stringWithFormat:@"Dove %d.png",i];
        UIImage *image=[UIImage imageNamed:file];
        [imageArray addObject:image];
    }
    bird.animationImages=imageArray;
    bird.animationRepeatCount=0;//设置为0表示一直播放
    //开始动画
    [bird startAnimating];
    //停止动画
    //    [bird stopAnimating];
    
    //需求：为了鸟在天空移动飞行
    //解决：每隔一点点时间改变鸟的位置
    //知识点：每隔一段时间移动（执行某个操作）
    //使用NSTimer定时器类
    //TimeInterval控制时间 每隔多少秒执行一次
    //参数target:<#(id)#> selector：表示每次执行哪个方法
    //参数repeats:是否重复执行
    //注意：由于人眼的视觉残留效应
    //一秒至少播放24张
    //代码的效果 每隔1/60秒就执行timeLoop方法
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(timeLoop:) userInfo:nil repeats:YES];
    two=[[TwoViewController alloc]init];
    three=[[ThreeViewController alloc]init];
    UINavigationController *navone=[[UINavigationController alloc]initWithRootViewController:self];
    UINavigationController *navtwo=[[UINavigationController alloc]initWithRootViewController:two];
    UINavigationController *navthree=[[UINavigationController alloc]initWithRootViewController:three];
    navone.title=@"1111";
    navtwo.title=@"2222";
    navthree.title=@"3333";
    UITabBarController *tab=[[UITabBarController alloc] init];
    tab.viewControllers=[NSArray arrayWithObjects:navone,navtwo,navthree, nil];
    self.window.rootViewController=tab;
    [self.window makeKeyAndVisible];
    [self buildNavgationButton];
}

-(void)buildNavgationButton
{
    UIBarButtonItem *nextbutton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(oneClicked:)];
    self.navigationItem.rightBarButtonItem=nextbutton;
    UIBarButtonItem *next2button=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(twoClicked:)];
    two.navigationItem.rightBarButtonItem=next2button;
    UIBarButtonItem *next3button=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(threeClicked:)];
    three.navigationItem.rightBarButtonItem=next3button;
}

-(void)oneClicked:(UIBarButtonItem *)item
{
    OneViewController *one=[[OneViewController alloc]init];
    [self.navigationController pushViewController: one animated:YES];
}

-(void)twoClicked:(UIBarButtonItem *)item
{
  Two1ViewController *two1=[[Two1ViewController alloc]init];
    [two.navigationController pushViewController: two1 animated:YES];
}

-(void)threeClicked:(UIBarButtonItem *)item
{
    Three1ViewController *three1=[[Three1ViewController alloc]init];
    [three.navigationController pushViewController: three1 animated:YES];
}

-(void)timeLoop:(NSTimer*)t
{
    //x轴上得速度
    double xSpeed=1;
    NSLog(@"");
    CGRect frame=bird.frame;
    frame.origin.x+=xSpeed;
    //如果鸟飞出了屏幕之外，重新让鸟从左边飞出
    if (bird.frame.origin.x>=320) {
        frame.origin.x=-frame.size.width;
    }
    //把改变后的位置设置为鸟的新位置
    bird.frame=frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
