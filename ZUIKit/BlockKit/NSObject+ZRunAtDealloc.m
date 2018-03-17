//
//  NSObject+ZRunAtDealloc.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/17.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "NSObject+ZRunAtDealloc.h"
#import <objc/runtime.h>

static const void * BKRunAtDeallocExcutorKey = &BKRunAtDeallocExcutorKey;

@interface BKRunAtDeallocExcutor : NSObject

- (id)initWithDeallocBlock:(void(^)(void))deallocBlock;

@property (nonatomic, copy) void(^deallocBlock)(void);

@end

@implementation BKRunAtDeallocExcutor

- (id)initWithDeallocBlock:(void (^)(void))deallocBlock {
    self = [super init];
    if (self) {
        self.deallocBlock = deallocBlock;
    }
    return self;
}


/**
 中间对象objc_setAssociatedObject关联的变量，当被关联对象object释放后，此中间对象也会被释放，因此会执行此方法；
 */
- (void)dealloc {
    self.deallocBlock ? self.deallocBlock() : nil;
}

@end

@implementation NSObject (ZRunAtDealloc)


/**
 监听对象被释放

 @param block object被释放执行的block回调
 */
- (void)bk_runAtDealloc:(void (^)(void))block {
    
    if (block) {
        BKRunAtDeallocExcutor *deallocExcutor = [[BKRunAtDeallocExcutor alloc] initWithDeallocBlock:block];
        objc_setAssociatedObject(self, BKRunAtDeallocExcutorKey, deallocExcutor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
