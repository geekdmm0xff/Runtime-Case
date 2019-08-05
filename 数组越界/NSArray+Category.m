//
//  NSArray+Category.m
//  数组越界
//
//  Created by GeekDuan on 2019/8/5.
//  Copyright © 2019 GeekDuan. All rights reserved.
//

#import "NSArray+Category.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSArray (Category)

+ (void)load {
    [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) method:@selector(my_objectAtIndex:)];
}

- (id)my_objectAtIndex:(NSUInteger)index {
    return (index < self.count - 1) ?  [self my_objectAtIndex:index] : nil;
}
@end
