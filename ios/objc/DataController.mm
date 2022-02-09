//
// Copyright (c) 2022 BBalance. All rights reserved.
//
// Copying this file via any medium without the prior written consent of BBalance is strictly prohibited.
// Proprietary and confidential.
//

#import "DataController.h"

@interface DataController ()

@end

@implementation DataController

struct SimpleCStruct {
    int intValue;
    float floatValue;
};

- (instancetype)init {
    if (self = [super init]) {}
    return self;
}

- (void)start {
    SimpleCStruct aStruct = (struct SimpleCStruct){1, 0.5};

    [self.delegate controller:self
            didOutputIntValue:aStruct.intValue
                andFloatValue:aStruct.floatValue];
}

@end
