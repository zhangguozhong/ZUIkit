# ZUIkit
封装系统控件的初始化方法，便于纯代码界面开发复用。


### 引用

pod 'ZUIKit'


### 例子
```objective-c
UIButton *button = [ZUIKit buttonWithTitle:@"test" handler:^(id sender) {
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
```

### 说明
目前只有UIView、UIButton、UILabel以及UITextField控件的初始化方法，还在不断更新中。
