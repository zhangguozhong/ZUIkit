//
//  ViewController.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ViewController.h"
#import "ZUIKit.h"
#import "NSObject+BlocksKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [ZUIKit buttonWithTitle:@"test" handler:^(UIButton *sender) {
        NSLog(@"测试点击事件");
    }];
    button.frame = CGRectMake(0, 100, 200, 40);
    [self.view addSubview:button];
    
    UIView *testView = [ZUIKit createViewWithHandler:^(UIGestureRecognizer *gesture, UIGestureRecognizerState state) {
        NSLog(@"测试tap手势");
    }];
    testView.frame = CGRectMake(0, 150, 200, 40);
    testView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:testView];
    
    
    NSObject *object = [[NSObject alloc] init];
    [object bk_runAtDealloc:^{
        NSLog(@"哎呀！对象被释放掉了！");
    }];
    
    
    UITextField *textfield = [ZUIKit textfieldWithPlaceholder:@"这个只是测试" fontSize:16 textColor:[UIColor redColor] textAlignment:NSTextAlignmentLeft placeholderAttributes:@{@"只是":@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}}];
    textfield.frame = CGRectMake(0, 300, 200, 40);
    [self.view addSubview:textfield];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
