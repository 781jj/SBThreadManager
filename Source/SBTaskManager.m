//
//  SBTaskManager.m
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import "SBTaskManager.h"
#import "SBTask.h"
static SBTaskManager* manager = nil;

@interface SBTaskManager()
@property (nonatomic,strong)NSMutableArray *taskList;
@end
@implementation SBTaskManager
+ (SBTaskManager *)shareInstance
{
    @synchronized(self)
    {
        if (manager == nil)
        {
            manager = [[self alloc] init];
            manager.taskList = [NSMutableArray array];
            [NSThread detachNewThreadSelector:@selector(run) toTarget:manager withObject:nil];
        }
    }
    return manager;
}

- (unsigned)highestPriority
{
    return ((SBTask *)[_taskList objectAtIndex:0]).priority;
}

- (void)run
{
    while (YES) {
        for (SBTask *task in _taskList) {
            if ([task isReady]) {
                [task start];
                if (![task isConcurrent]) {
                    [task main];
                    BOOL isFinish = YES;
                    while (![task isFinished]) {
                        if([task isCancle]){
                            isFinish = NO;
                            [task cancle];
                            break;
                        }
                    }
                    if (task.callBack) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            task.callBack(task.name,isFinish);
                        });
                    }
                }else{
                    [NSThread detachNewThreadSelector:@selector(runConcurrent:) toTarget:self withObject:task];
                }
                
                [_taskList removeObject:task];
                break;
            }else{
                continue;
            }
        }
    }
}       


- (void)runConcurrent:(SBTask *)task
{
    
    while(![[task valueForKey:@"isExecuting"] boolValue]){
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    [task main];
    BOOL isFinish = YES;
    while (![task isFinished]) {
        if([task isCancle]){
            isFinish = NO;
            [task cancle];
            break;
        }
    }
    if (task.callBack) {
        dispatch_async(dispatch_get_main_queue(), ^{
            task.callBack(task.name,isFinish);
        });
    }
}

- (void)addTask:(SBTask *)task
{
    if ([_taskList count]>0) {
        if (task.priority <= ((SBTask *)[_taskList objectAtIndex:0]).priority) {
            [_taskList insertObject:task atIndex:0];
        }
    }else{
         [_taskList addObject:task];
    }
}

- (void)jumpTask:(SBTask *)task
{
    task.priority = 0;
    [self addTask:task];
}




@end
