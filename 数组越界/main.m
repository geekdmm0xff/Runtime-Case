//
//  main.m
//  数组越界
//
//  Created by GeekDuan on 2019/8/5.
//  Copyright © 2019 GeekDuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Swizzling.h"

@interface Person : NSObject
- (void)work;
- (void)study;
@end

@implementation Person

+ (void)load {
    [Person swizzleMethod:@selector(work) method:@selector(study)];
}

- (void)work {
    NSLog(@"%s", __func__);
}

- (void)study {
    NSLog(@"%s", __func__);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *p = [Person new];
        [p work];
        [p study];
        
        NSArray *arr = @[@1, @2];
        NSNumber *e = [arr objectAtIndex:2];
        NSLog(@"%@", e);
    }
    return 0;
}
