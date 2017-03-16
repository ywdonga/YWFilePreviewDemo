//
//  YWFilePreviewView.h
//  YWFilePreviewDemo
//
//  Created by dyw on 2017/3/16.
//  Copyright © 2017年 dyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWFilePreviewView : UIView

/** 快速预览单个文件 */
+ (void)previewFileWithPaths:(NSString *)filePath;

@end
