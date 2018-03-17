//
//  ZUIKit.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZUIKit.h"
#import "UIControl+BlockKit.h"
#import "UIGestureRecognizer+BlockKit.h"

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
    return [self labelWithText:text fontSize:14];
}

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self labelWithText:text fontSize:fontSize textColor:[UIColor blackColor]];
}

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self labelWithText:text fontSize:fontSize textColor:textColor textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.textAlignment = TextAlignment;
    return label;
}


#pragma mark create button method
+ (UIButton *)buttonWithTitle:(NSString *)title {
    return [self buttonWithTitle:title titleColor:[UIColor blackColor]];
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    return [self buttonWithTitle:title titleColor:titleColor handler:nil];
}

+ (UIButton *)buttonWithTitle:(NSString *)title handler:(void (^)(id))handler {
    return [self buttonWithTitle:title titleColor:[UIColor blackColor] handler:handler];
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void (^)(id))handler {
    return [self buttonWithImage:nil title:title titleColor:titleColor handler:handler];
}

+ (UIButton *)buttonWithImage:(UIImage *)image {
    return [self buttonWithImage:image title:nil];
}

+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title {
    return [self buttonWithImage:image title:title titleColor:[UIColor blackColor]];
}

+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    return [self buttonWithImage:image title:title titleColor:titleColor handler:nil];
}

+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor handler:(void (^)(id))handler {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (handler) {
        [button bk_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

@end