//
//  AutoClass.m
//  JsDemo
//
//  Created by wangxu-mp on 2020/4/12.
//  Copyright © 2020 wangxu. All rights reserved.
//

#import "AutoClass.h"

@interface AutoClass()
@property (nonatomic, strong) NSString *name;

@end

@implementation AutoClass

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        self.name = @"hahaha";
    }
    return self;
}



@end
