//
//  ViewController.m
//  WXeye
//
//  Created by 何松泽 on 16/2/16.
//  Copyright © 2016年 HSZ. All rights reserved.
//


#import "ViewController.h"
#import "UIColor+Colors.h"
#import "HSZwxEyeView.h"
#import "FirstInViewController.h"
#import "AppDelegate.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define APPDELEGATE     ((AppDelegate *)[[UIApplication sharedApplication]delegate])

@interface ViewController ()

@property (nonatomic, strong)HSZwxEyeView *tableview;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Find";
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)];
    search.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = search;
    
    // Do any additional setup after loading the view, typically from a nib.
    _tableview = [[HSZwxEyeView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_tableview];
    
}

-(void)search:(id)sender
{
    FirstInViewController *vc = [[FirstInViewController alloc]init];
    [self.navigationController pushViewController:vc animated:TRUE];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self];
    [APPDELEGATE.window setRootViewController:nav];
    
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIColor createImageWithColor:[UIColor ZNavBarTeal]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setTranslucent:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
