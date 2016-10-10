//
//  FirstInViewController.m
//  WXeye
//
//  Created by 何松泽 on 16/2/17.
//  Copyright © 2016年 HSZ. All rights reserved.
//

enum City_name
{
    Kyoto = 0,
    ShangHai = 1,
    NewYork = 2,
    Paris = 3,
};

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#import "FirstInViewController.h"
#import "FirstInTableViewCell.h"
#import "ViewController.h"
#import "UIColor+Colors.h"

#define MoreHeight  [UIScreen mainScreen].bounds.size.height/10

@interface FirstInViewController ()<UITableViewDataSource,UITableViewDelegate>{
    CGFloat navHeight;
    CGFloat rectStatus;
}

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ViewController *detailVC;

@end

@implementation FirstInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.tableView setBackgroundColor:[UIColor ZNavBarGlobalBlue]];
    self.tableView.delegate = (id)self;
    self.tableView.dataSource = (id)self;
    self.tableView.scrollEnabled = FALSE;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.layer.anchorPoint =CGPointMake(0, 0.5);
    [self.tableView  setBackgroundColor:[UIColor blackColor]];
    
    NSLog(@"%f,%f",([UIScreen mainScreen].bounds.size.height-navHeight-rectStatus-MoreHeight)/4,[UIScreen mainScreen].bounds.size.width);
    
    [self.view addSubview:self.tableView];
    [self registerCellPrototype];
}

-(void)viewWillAppear:(BOOL)animated
{
    navHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    rectStatus = CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]);
    [self.navigationController.navigationBar setBackgroundImage:[UIColor createImageWithColor:[UIColor ZNavBarTeal]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController setNavigationBarHidden:TRUE animated:NO];
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (BOOL)prefersStatusBarHidden
{
    // iOS7后,[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    // 已经不起作用了
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)registerCellPrototype
{
    [self.tableView registerNib:[UINib nibWithNibName:cellNibName_FirstInTableViewCell bundle:nil] forCellReuseIdentifier:cellNibName_FirstInTableViewCell];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row <= 3) {
//        return  ([UIScreen mainScreen].bounds.size.height-navHeight-rectStatus-MoreHeight)/4;
        return ([UIScreen mainScreen].bounds.size.height-MoreHeight)/4;
        
    }
    return MoreHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *cityImage;
    if (indexPath.row <= 3) {
        FirstInTableViewCell *returCell = [tableView dequeueReusableCellWithIdentifier:cellNibName_FirstInTableViewCell];
        returCell.superController = self;
        switch (indexPath.row) {
            case Kyoto:{
                cityImage = [UIImage imageNamed:@"jingdu"];
                cityImage = [cityImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
                [returCell setDataForItem:@"京都" countryImage:cityImage praiseNum:@"100" commentNum:@"20"];
            }
                break;
            case ShangHai:
                cityImage = [UIImage imageNamed:@"shanghai"];
                cityImage = [cityImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
                [returCell setDataForItem:@"上海" countryImage:cityImage praiseNum:@"100" commentNum:@"20"];
                break;
            case NewYork:
                cityImage = [UIImage imageNamed:@"NewYork"];
                cityImage = [cityImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
                [returCell setDataForItem:@"纽约" countryImage:cityImage praiseNum:@"100" commentNum:@"20"];
                break;
            case Paris:
                cityImage = [UIImage imageNamed:@"Paris"];
                cityImage = [cityImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
                [returCell setDataForItem:@"巴黎" countryImage:cityImage praiseNum:@"100" commentNum:@"20"];
                break;
            default:
                break;
        }
        
        
        cell = returCell;
    }else if (indexPath.row ==4){
        FirstInTableViewCell *returCell = [tableView dequeueReusableCellWithIdentifier:cellNibName_FirstInTableViewCell];
        [returCell setCityImage:@"NewYork"];
        returCell.superController = self;
        cell = returCell;
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case Kyoto:
            [self toKyoto];
            break;
        case ShangHai:
            break;
        case NewYork:
            break;
        case Paris:
            break;
        default:
            break;
    }
}

-(void)toKyoto
{
    UIViewController *sourceViewController = self;
    
    self.detailVC = [[ViewController alloc]init];
    self.detailVC.view.layer.anchorPoint = CGPointMake(1, 0.5);
    [self.detailVC.view setCenter:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
    transform.m34=1.0/2000;//透视效果
    transform=CATransform3DRotate(transform,M_PI/4,0,1,0);//获取旋转angle角度后的rotation矩阵。
    transform=CATransform3DScale(transform, 0.8f, 0.8f, 1.f);
    self.detailVC.view.layer.transform = transform;
    self.detailVC.view.hidden = TRUE;
    self.detailVC.view.alpha = 0.f;
    
    [UIView animateWithDuration:0.5f animations:^{
        [sourceViewController.view setCenter:CGPointMake(-50, SCREEN_HEIGHT/2)];
        CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
        transform.m34=1.0/-2000;//透视效果
        transform=CATransform3DRotate(transform,M_PI/4,0,1,0);//获取旋转angle角度后的rotation矩阵。
        transform=CATransform3DScale(transform, 0.8f, 0.8f, 1.f);
        
        sourceViewController.view.layer.transform = transform;
        [[sourceViewController.view superview] addSubview:self.detailVC.view];
    } completion:^(BOOL finished) {
        
        self.detailVC.view.hidden = FALSE;
        self.detailVC.view.alpha = 0.5f;
        [UIView animateWithDuration:0.5f animations:^{
            
            CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
                transform.m34=1.0/-2000;//透视效果
                transform=CATransform3DRotate(transform,M_PI/32,0,1,0);//获取旋转angle角度后的rotation矩阵。
                transform=CATransform3DScale(transform, 1.f, 1.f, 1.f);
            
                self.detailVC.view.layer.transform = transform;
            self.detailVC.view.alpha = 1.f;
            sourceViewController.view.alpha = 0.f;
            
        } completion:^(BOOL finished) {
            [self presentViewController:self.detailVC animated:NO completion:nil];
        }];
        
    }];
    
}

@end
