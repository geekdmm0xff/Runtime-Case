//
//  NSObject+Swizzling.m
//  数组越界
//
//  Created by GeekDuan on 2019/8/5.
//  Copyright © 2019 GeekDuan. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)swizzleMethod:(SEL)original method:(SEL)current {
    // 1. 是否存在 SEL
    Method orgM = class_getInstanceMethod(self, original);
    if (!orgM) {
        return;
    }
    Method curM = class_getInstanceMethod(self, current);
    if (!curM) {
        return;
    }
    
    // 2.创建方法，防止替换父类同名
    class_addMethod(self, original, method_getImplementation(orgM), method_getTypeEncoding(orgM));
    class_addMethod(self, current, method_getImplementation(orgM), method_getTypeEncoding(orgM));
    
    // 3.
    method_exchangeImplementations(orgM, curM);
}

@end
