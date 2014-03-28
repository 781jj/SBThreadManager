//
//  SBTaskManager.h
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SBTask;
@interface SBTaskManager : NSObject
@property (nonatomic,readonly)unsigned highestPriority;

+ (SBTaskManager *)shareInstance;
- (void)addTask:(SBTask *)task;
- (void)jumpTask:(SBTask *)task;
@end
