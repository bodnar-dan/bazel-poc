//
// Copyright (c) 2022 BBalance. All rights reserved.
//
// Copying this file via any medium without the prior written consent of BBalance is strictly prohibited.
// Proprietary and confidential.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DataController;

@protocol DataControllerDelegate
-(void)controller:(DataController *)controller
didOutputIntValue:(int)intValue
    andFloatValue:(float)floatValue;
@end

@interface DataController: NSObject

@property (weak, nonatomic) id<DataControllerDelegate> delegate;

- (void)start;

@end

NS_ASSUME_NONNULL_END
