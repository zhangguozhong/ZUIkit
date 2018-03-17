//
//  UIControl+BlockKit.m
//  ZUIKit
//
//  Created by 张国忠 on 2018/3/16.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "UIControl+BlockKit.h"
#import <objc/runtime.h>

static const void *BKControlHandlersKey = &BKControlHandlersKey;

@interface BKControlWrapper: NSObject<NSCopying>

- (id)initWithHandler:(void(^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic, copy) void (^handler)(id sender);

@end

@implementation BKControlWrapper

- (id)initWithHandler:(void (^)(id))handler forControlEvents:(UIControlEvents)controlEvents{
    self = [super init];
    if (self) {
        self.controlEvents = controlEvents;
        self.handler = handler;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    return [[BKControlWrapper alloc] initWithHandler:self.handler forControlEvents:self.controlEvents];
}

- (void)doHandler:(id)sender{
    self.handler(sender);
}

@end

@implementation UIControl (BlockKit)

- (void)bk_addEventHandler:(void (^)(id))handler forControlEvents:(UIControlEvents)controlEvents{
    NSParameterAssert(handler);
    
    NSMutableDictionary *events = objc_getAssociatedObject(self, BKControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, BKControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSMutableSet *handlers = events[key];
    if (!handlers) {
        handlers = [NSMutableSet set];
        events[key] = handlers;
    }
    
    BKControlWrapper *target = [[BKControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
    [handlers addObject:target];
    [self addTarget:target action:@selector(doHandler:) forControlEvents:controlEvents];
}

- (void)bk_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents{
    NSMutableDictionary *events = objc_getAssociatedObject(self, BKControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, BKControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSMutableSet *handlers = events[key];
    if (!handlers) {
        return;
    }
    
    [handlers enumerateObjectsUsingBlock:^(id  _Nonnull sender, BOOL * _Nonnull stop) {
        [self removeTarget:sender action:NULL forControlEvents:controlEvents];
    }];
    [events removeObjectForKey:key];
}

- (BOOL)bk_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents{
    NSMutableDictionary *events = objc_getAssociatedObject(self, BKControlHandlersKey);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, BKControlHandlersKey, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSNumber *key = @(controlEvents);
    NSMutableSet *handlers = events[key];
    
    if (!handlers) {
        return NO;
    }
    return !!handlers.count;
}

@end
