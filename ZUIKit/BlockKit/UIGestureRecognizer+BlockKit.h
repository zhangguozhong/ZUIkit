//
//  UIGestureRecognizer+BlockKit.h
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/17.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (BlockKit)

+ (instancetype)bk_recognizerWithHandler:(void(^)(UIGestureRecognizer *sender, UIGestureRecognizerState state))handler;
- (instancetype)bk_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state))block;

@property (nonatomic, assign, setter=bk_setShouldHandleAction:) BOOL bk_shouldHandleAction;

@end
