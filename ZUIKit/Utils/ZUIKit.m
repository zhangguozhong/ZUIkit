//
//  ZUIKit.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZUIKit.h"
#import "UIButton+BlocksKit.h"
#import "UIGestureRecognizer+BlocksKit.h"

static const CGFloat ZUIKitLabelTextDefaultFontSize = 14.f;
static const CGFloat ZUIKitTextFieldDefaultFontSize = 14.f;
static const CGFloat ZUIKitButtonTitleDefaultFontSize = 17.f;

@implementation ZUIKit

#pragma mark - create view method
+ (UIView *)createView {
    return [self createViewWithFrame:CGRectZero];
}

+ (UIView *)createViewWithFrame:(CGRect)frame {
    return [self createViewWithFrame:frame backgroundColor:[UIColor whiteColor]];
}

+ (UIView *)createViewWithHandler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler {
    return [self createViewWithFrame:CGRectZero backgroundColor:[UIColor whiteColor] handler:handler];
}

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor {
    return [self createViewWithFrame:frame backgroundColor:backgroundColor handler:nil];
}


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


#pragma mark create label method
+ (UILabel *)labelWithText:(NSString *)text {
    return [self labelWithText:text fontSize:ZUIKitLabelTextDefaultFontSize];
}

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self labelWithText:text fontSize:fontSize textColor:[UIColor blackColor]];
}

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self labelWithText:text fontSize:fontSize textColor:textColor textAlignment:NSTextAlignmentLeft];
}


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


#pragma mark create button method

/**
 创建button对象

 @param image 按钮图片
 @param handler 点击按钮要执行的事件
 @return button对象
 */
+ (UIButton *)buttonWithImage:(UIImage *)image handler:(void (^)(UIButton *))handler {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (handler) {
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

+ (UIButton *)buttonWithTitle:(NSString *)title handler:(void (^)(UIButton *))handler {
    return [self buttonWithTitle:title fontSize:ZUIKitButtonTitleDefaultFontSize handler:handler];
}

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize handler:(void (^)(UIButton *))handler {
    return [self buttonWithTitle:title fontSize:fontSize titleColor:[UIColor blackColor] handler:handler];
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void (^)(UIButton *))handler {
    return [self buttonWithTitle:title fontSize:ZUIKitButtonTitleDefaultFontSize titleColor:titleColor handler:handler];
}


/**
 创建button对象

 @param title 按钮标题
 @param fontSize 文字字号大小
 @param titleColor 字体颜色
 @param handler 点击按钮要执行的事件
 @return button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor handler:(void (^)(UIButton *))handler {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (handler) {
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}


#pragma mark - create textfield method
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder {
    return [self textfieldWithPlaceholder:placeholder fontSize:ZUIKitTextFieldDefaultFontSize];
}

+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize {
    return [self textfieldWithPlaceholder:placeholder fontSize:fontSize textColor:[UIColor blackColor]];
}

+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self textfieldWithPlaceholder:placeholder fontSize:fontSize textColor:textColor textAlignment:NSTextAlignmentLeft];
}

+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    return [self textfieldWithPlaceholder:placeholder fontSize:fontSize textColor:textColor textAlignment:textAlignment placeholderAttributes:nil];
}


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

@end
