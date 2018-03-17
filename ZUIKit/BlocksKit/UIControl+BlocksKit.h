//
//  UIControl+BlockKit.h
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BlocksKit)


/**
 添加点击事件

 @param handler 点击按钮执行的block
 @param controlEvents 事件类型
 */
- (void)bk_addEventHandler:(void(^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;


/**
 移除按钮事件

 @param controlEvents 事件类型
 */
- (void)bk_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

- (BOOL)bk_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
