//
//  MTFThemeClassApplier.m
//  Motif
//
//  Created by Eric Horacek on 6/8/15.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import "MTFThemeClassApplier.h"

@implementation MTFThemeClassApplier

#pragma mark - NSObject

- (instancetype)init {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    // Ensure that exception is thrown when just `init` is called.
    self = [self initWithClassApplierBlock:nil];
#pragma clang diagnostic pop
    return self;
}

#pragma mark - MTFThemeClassApplier

- (instancetype)initWithClassApplierBlock:(MTFThemeClassApplierBlock)applierBlock {
    NSParameterAssert(applierBlock != nil);

    self = [super init];
    if (self == nil) return nil;

    _applierBlock = applierBlock;

    return self;
}

#pragma mark - MTFThemeClassApplier <MTFDynamicThemeApplier>

@dynamic properties;

- (NSArray *)properties {
    return @[];
}

- (BOOL)applyClass:(MTFThemeClass *)class toObject:(id)object; {
    NSParameterAssert(class != nil);
    NSParameterAssert(object != nil);
    
    self.applierBlock(class, object);

    return YES;
}

@end
