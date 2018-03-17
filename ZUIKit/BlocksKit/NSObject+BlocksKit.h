//
//  NSObject+ZRunAtDealloc.h
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/17.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BlocksKit)


/**
 监听对象被释放
 
 @param block object被释放执行的block回调
 */
- (void)bk_runAtDealloc:(void(^)(void))block;

@end
