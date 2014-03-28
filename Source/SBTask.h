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
- (BOOL)isFinished;
- (BOOL)isExecuting;
- (BOOL)isReady;

- (void)cancle;
- (BOOL)isCancle;

@end