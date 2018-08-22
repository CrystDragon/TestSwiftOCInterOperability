//
//  OCSide.m
//  TestSwiftOCInterOperability
//
//  Created by 吴君恺 on 2018/8/22.
//  Copyright © 2018 wjk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestSwiftOCInterOperability-Swift.h"

void testOCFunction() {
    Concrete2 *c = [[Concrete2 alloc] init];
    [c print];
}
