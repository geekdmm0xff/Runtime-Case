//
//  NSObject+Swizzling.h
//  数组越界
//
//  Created by GeekDuan on 2019/8/5.
//  Copyright © 2019 GeekDuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)
+ (void)swizzleMethod:(SEL)original method:(SEL)current;
@end

NS_ASSUME_NONNULL_END
