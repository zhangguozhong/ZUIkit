//
//  UIGestureRecognizer+BlockKit.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/17.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "UIGestureRecognizer+BlocksKit.h"
#import <objc/runtime.h>

static const void * BKGestureHandlerKey = &BKGestureHandlerKey;

@interface BKGestureHandler : NSObject<NSCopying>

- (id)initWithHandler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler;

@property (nonatomic, copy) void (^bk_handler)(UIGestureRecognizer *, UIGestureRecognizerState);

@end

@implementation BKGestureHandler

- (id)initWithHandler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler {
    self = [super init];
    if (self) {
        self.bk_handler = handler;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[BKGestureHandler alloc] initWithHandler:self.bk_handler];
}

- (void)doHandler:(UIGestureRecognizer *)gesture {
    if (gesture.bk_shouldHandleAction) {
        self.bk_handler(gesture, gesture.state);
    }
}

@end

@implementation UIGestureRecognizer (BlocksKit)

+ (instancetype)bk_recognizerWithHandler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler {
    return [[[self class] alloc] bk_initWithHandler:handler];
}

- (instancetype)bk_initWithHandler:(void (^)(UIGestureRecognizer *, UIGestureRecognizerState))handler {
    NSMutableSet *gestures = objc_getAssociatedObject(self, BKGestureHandlerKey);
    if (!gestures) {
        gestures = [NSMutableSet set];
        objc_setAssociatedObject(self, BKGestureHandlerKey, gestures, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    BKGestureHandler *target = [[BKGestureHandler alloc] initWithHandler:handler];
    [gestures addObject:target];
    return [self initWithTarget:target action:@selector(doHandler:)];
}

- (void)bk_setShouldHandleAction:(BOOL)flag {
    objc_setAssociatedObject(self, @selector(bk_shouldHandleAction), @(flag), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)bk_shouldHandleAction {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
