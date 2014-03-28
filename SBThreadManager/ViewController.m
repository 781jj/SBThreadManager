//
//  ViewController.m
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import "ViewController.h"
#import "SBTaskManager.h"
#import "SBImageTask.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *imageurl = @"http://www.kutx.cn/xiaotupian/icons/png/200803/20080327095245737.png";
    for (int i = 0; i<100; i++) {
        SBImageTask *task = [[SBImageTask alloc] initWithImageUrl:imageurl finishCallBack:^(NSString *name,BOOL finish){
            NSLog(@"finish,%@,%d",name,finish);
        }];
        task.name = [NSString stringWithFormat:@"task--%d",i];
        [[SBTaskManager shareInstance] addTask:task];
    }
// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
