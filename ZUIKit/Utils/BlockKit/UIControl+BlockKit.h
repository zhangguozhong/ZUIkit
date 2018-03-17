//
//  UIControl+BlockKit.h
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BlockKit)

- (void)bk_addEventHandler:(void(^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

- (void)bk_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

- (BOOL)bk_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
