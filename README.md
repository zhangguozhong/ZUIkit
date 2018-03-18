# ZUIkit
封装系统控件的初始化方法，便于纯代码界面开发复用。


### 引用

pod 'ZUIKit'


### 初始化UIView
```objective-c
/**
 创建UIView对象

 @param frame view的布局大小
 @param backgroundColor 背景色
 @param handler tap手势执行的事件
 @return view对象
 */
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor handler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler {
    UIView *view = [[UIView alloc] init];
    view.frame = frame;
    
    if (handler) {
        UITapGestureRecognizer *gesture = [UITapGestureRecognizer bk_recognizerWithHandler:handler];
        gesture.bk_shouldHandleAction = YES;
        [view addGestureRecognizer:gesture];
    }
    return view;
}
```

### 初始化UILabel
```objective-c
/**
 创建UILabel对象

 @param text 显示的文字
 @param fontSize 字号大小
 @param textColor 字体颜色
 @param TextAlignment 文字排列方式
 @return label对象
 */
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.textAlignment = TextAlignment;
    return label;
}
```

### 初始化UIButton
```objective-c
/**
 创建button对象

 @param image 按钮图片
 @param handler 点击按钮要执行的事件
 @return button对象
 */
+ (UIButton *)buttonWithImage:(UIImage *)image handler:(void (^)(id))handler {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (handler) {
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

/**
 创建button对象

 @param title 按钮标题
 @param fontSize 文字字号大小
 @param titleColor 字体颜色
 @param handler 点击按钮要执行的事件
 @return button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor handler:(void (^)(id))handler {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (handler) {
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}
```

### 初始化UITextField
```objective-c
/**
 创建UITextField对象

 @param placeholder placeholder描述
 @param fontSize 字号大小
 @param textColor 字体颜色
 @param textAlignment 文字排列方式
 @param placeholderAttributes placeholder样式
 @return textfield对象
 */
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment placeholderAttributes:(NSDictionary<id, NSDictionary<NSAttributedStringKey, id> *> *)placeholderAttributes {
    UITextField *textfield = [[UITextField alloc] init];
    textfield.placeholder = placeholder;
    textfield.font = [UIFont systemFontOfSize:fontSize];
    textfield.textColor = textColor;
    textfield.textAlignment = textAlignment;
    
    if (placeholderAttributes) {
        NSMutableAttributedString *attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:textfield.placeholder];
        [placeholderAttributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull keyWords, NSDictionary<NSAttributedStringKey,id> * _Nonnull allAttrs, BOOL * _Nonnull stop) {
            if (allAttrs) {
                [attributedPlaceholder addAttributes:allAttrs range:[textfield.placeholder rangeOfString:keyWords]];
            }
        }];
        textfield.attributedPlaceholder = attributedPlaceholder;
    }
    return textfield;
}
```
