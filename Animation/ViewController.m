//
//  ViewController.m
//  Animation
//
//  Created by DT on 2018/6/5.
//  Copyright © 2018年 dt. All rights reserved.
//

#import "ViewController.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height//获取屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width//获取屏幕宽度
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(AnimationView *)tableView{
    if(!_tableView)
    {
        _tableView = [[AnimationView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth-20, kScreenHeight) style:UITableViewStyleGrouped];
    }
    return _tableView;
}
@end
