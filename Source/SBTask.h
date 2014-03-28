//
//  SBTask.h
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SBTaskCallBack)(NSString *,BOOL isFinish);

@interface SBTask : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,copy)SBTaskCallBack callBack;
@property (nonatomic,assign)unsigned priority;

//must done
- (void)start;
- (void)main;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)isConcurrent;

- (void)cancle;
- (BOOL)isCancle;

@end
