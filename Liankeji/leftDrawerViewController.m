//
//  leftDrawerViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/14.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "leftDrawerViewController.h"

@interface leftDrawerViewController ()

@end

@implementation leftDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.jpg"]];
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
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
