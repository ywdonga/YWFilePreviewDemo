//
//  YWFilePreviewController.h
//  YWFilePreviewDemo
//
//  Created by dyw on 2017/3/16.
//  Copyright © 2017年 dyw. All rights reserved.
//

#import <QuickLook/QuickLook.h>

typedef enum : NSUInteger {
    YWJumpPush,//push 无动画
    YWJumpPushAnimat,//push 有动画
    YWJumpPresent,//Present 无动画
    YWJumpPresentAnimat,//Present 有动画
} YWJumpMode;

@interface YWFilePreviewController : QLPreviewController

/** 预览多个文件 单个文件时数组传一个 */
- (void)previewFileWithPaths:(NSArray <NSString *>*)filePathArr on:(UIViewController *)vc jump:(YWJumpMode)jump;

/** 将要退出 */
- (void)setWillDismissBlock:(void (^)())willDismissBlock;

/** 已经退出 */
- (void)setDidDismissBlock:(void (^)())didDismissBlock;

/** 将要访问文件中的Url回调  BOOL 是否允许访问*/
- (void)setShouldOpenUrlBlock:(BOOL (^)(NSURL *, id<QLPreviewItem>))shouldOpenUrlBlock;

@end
