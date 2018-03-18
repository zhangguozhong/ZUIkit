//
//  ZUIKit.h
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZUIKit : NSObject

#pragma mark - create view method

/**
 初始化UIView的方法

 @return view对象
 */
+ (UIView *)createView;
+ (UIView *)createViewWithFrame:(CGRect)frame;
+ (UIView *)createViewWithHandler:(void(^)(UIGestureRecognizer *gesture, UIGestureRecognizerState state))handler;
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor handler:(void(^)(UIGestureRecognizer *sender, UIGestureRecognizerState state))handler;


#pragma mark - create label method

/**
 初始化UILabel的方法
 
 @return label对象
 */
+ (UILabel *)labelWithText:(NSString *)text;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment;


#pragma mark - create button method

/**
 初始化UIButton的方法

 @return button对象
 */
+ (UIButton *)buttonWithImage:(UIImage *)image handler:(void(^)(UIButton *sender))handler;
+ (UIButton *)buttonWithTitle:(NSString *)title handler:(void(^)(UIButton *sender))handler;
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void(^)(UIButton *sender))handler;
+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize handler:(void(^)(UIButton *sender))handler;
+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor handler:(void(^)(UIButton *sender))handler;


#pragma mark - create textfield method

/**
 初始化UITextField的方法

 @return textfield
 */
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder;
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize;
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;
+ (UITextField *)textfieldWithPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment placeholderAttributes:(NSDictionary<id, NSDictionary<NSAttributedStringKey, id> *> *)placeholderAttributes;

@end
