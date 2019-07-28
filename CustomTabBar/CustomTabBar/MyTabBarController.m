//
//  MyTabBarController.m
//  CustomTabBar
//
//  Created by Myron on 2019/7/27.
//  Copyright © 2019 Myron. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyTabBar.h"
#import "MyNavigationController.h"

@interface MyTabBarController ()<MyTabBarDelegate>

//tabbarVC数组
@property(nonatomic,strong) NSArray *array;
//normal状态图片显示数组
@property(nonatomic,strong) NSArray *imageArray;
//select状态图片显示数组
@property(nonatomic,strong) NSArray *selectImageArray;
//tabbarbutton上显示的文字数组
@property(nonatomic,strong) NSArray *tabTitles;

@end

@implementation MyTabBarController

+ (void)load{
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = UIColor.redColor;
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [[UITabBarItem appearance] setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MyTabBar *tabBar = [[MyTabBar alloc] init];
    tabBar.delegate = self;
    //用kvc把readly的tabBar属性改成自定义的
    [self setValue:tabBar forKey:@"tabBar"];
    [self setTabBar];
    
    
}

- (void)setTabBar{
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.navigationItem.title = @"vc1";
    [vc1.view setBackgroundColor:UIColor.whiteColor];
    MyNavigationController *shipingNav = [[MyNavigationController alloc] initWithRootViewController:vc1];
//    [self addChildViewController:shipingNav];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.navigationItem.title = @"vc2";
    [vc2.view setBackgroundColor:UIColor.whiteColor];
    MyNavigationController *shebeiNav = [[MyNavigationController alloc] initWithRootViewController:vc2];
//    [self addChildViewController:shebeiNav];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.navigationItem.title = @"vc3";
    [vc3.view setBackgroundColor:UIColor.whiteColor];
    MyNavigationController *xiangbuNav = [[MyNavigationController alloc] initWithRootViewController:vc3];
//    [self addChildViewController:xiangbuNav];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.navigationItem.title = @"vc4";
    [vc4.view setBackgroundColor:UIColor.whiteColor];
    MyNavigationController *gerenNav = [[MyNavigationController alloc] initWithRootViewController:vc4];
//    [self addChildViewController:gerenNav];
    
    
    self.imageArray = @[@"shipingDF",@"shebeiDF",@"xiangbuDF",@"gerenDF"];
    self.selectImageArray = @[@"shipingSE",@"shebeiSE",@"xiangbuSE",@"gerenSE"];
    self.tabTitles = @[@"视频",@"摄备",@"相薄",@"个人"];
    self.array = [[NSArray alloc]initWithObjects: shipingNav,shebeiNav,xiangbuNav,gerenNav,nil];
    self.viewControllers = self.array;
    NSLog(@"tabBarItems count--------%lu",self.tabBar.items.count);
    for(int i = 0; i < self.tabBar.items.count; i++){
        
        UITabBarItem* tabBarItem = self.tabBar.items[i];
        
        [tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        tabBarItem.title = self.tabTitles[i];
        tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.selectImageArray[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
    }
    self.selectedIndex = 0;
    
}

#pragma mark - 点击中间按钮
- (void)tabBarDidClickCenterButton:(MyTabBar *)tabBar{
    NSLog(@"tabBarDidClickCenterButton");
}


@end
