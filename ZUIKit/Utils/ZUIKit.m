//
//  ZUIKit.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZUIKit.h"
#import "UIControl+BlocksKit.h"
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

+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.textAlignment = TextAlignment;
    return label;
}


#pragma mark create button method
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

+ (UIButton *)buttonWithTitle:(NSString *)title handler:(void (^)(id))handler {
    return [self buttonWithTitle:title fontSize:ZUIKitButtonTitleDefaultFontSize handler:handler];
}

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize handler:(void (^)(id))handler {
    return [self buttonWithTitle:title fontSize:fontSize titleColor:[UIColor blackColor] handler:handler];
}

+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void (^)(id))handler {
    return [self buttonWithTitle:title fontSize:ZUIKitButtonTitleDefaultFontSize titleColor:titleColor handler:handler];
}

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
