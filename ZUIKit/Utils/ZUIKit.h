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
+ (UIView *)createView;
+ (UIView *)createViewWithFrame:(CGRect)frame;
+ (UIView *)createViewWithHandler:(void(^)(UIGestureRecognizer *gesture, UIGestureRecognizerState state))handler;
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor handler:(void(^)(UIGestureRecognizer *sender, UIGestureRecognizerState state))handler;


#pragma mark - create label method
+ (UILabel *)labelWithText:(NSString *)text;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (UILabel *)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)TextAlignment;


#pragma mark - create button method
+ (UIButton *)buttonWithTitle:(NSString *)title;
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;
+ (UIButton *)buttonWithTitle:(NSString *)title handler:(void(^)(id sender))handler;
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor handler:(void(^)(id sender))handler;

+ (UIButton *)buttonWithImage:(UIImage *)image;
+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title;
+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor;
+ (UIButton *)buttonWithImage:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor handler:(void(^)(id sender))handler;

@end
