//
//  SBImageTask.h
//  SBThreadManager
//
//  Created by Yao Ming on 14-3-28.
//  Copyright (c) 2014年 Yao Ming. All rights reserved.
//

#import "SBTask.h"

@interface SBImageTask : SBTask
@property (nonatomic,readonly)UIImage *image;
@property (nonatomic,strong)NSString *imageUrl;

- (id)initWithImageUrl:(NSString *)url finishCallBack:(SBTaskCallBack)callback;
@end
