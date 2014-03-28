//
//  SBImageTask.m
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import "SBImageTask.h"
@interface SBImageTask ()
@property (nonatomic,strong)UIImage *image;
@end
@implementation SBImageTask
- (id)initWithImageUrl:(NSString *)url finishCallBack:(SBTaskCallBack)callback
{
    self = [super init];
    if (self) {
        self.imageUrl = url;
        self.callBack = callback;
    }
    return self;
}


- (BOOL)isConcurrent
{
    return YES;
}

- (void)start
{
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageUrl]]];
}

- (BOOL)isReady
{
    return YES;
}

- (BOOL)isFinished
{
    return _image!=nil;
}

@end
