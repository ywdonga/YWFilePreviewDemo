//
//  YWFilePreviewView.m
//  YWFilePreviewDemo
//
//  Created by dyw on 2017/3/16.
//  Copyright © 2017年 dyw. All rights reserved.
//

#import "YWFilePreviewView.h"
#import <QuickLook/QuickLook.h>

#define YWKeyWindow [UIApplication sharedApplication].keyWindow
#define YWS_W YWKeyWindow.bounds.size.width
#define YWS_H YWKeyWindow.bounds.size.height
#define YW_NAV_Hight 64

@interface YWFilePreviewView ()
<QLPreviewControllerDataSource, QLPreviewControllerDelegate>
@property (nonatomic, assign) BOOL hindNav;
@property (nonatomic, strong) QLPreviewController *previewController;
@property (nonatomic, strong) NSArray *filePathArr;

@end

@implementation YWFilePreviewView

#pragma mark - life cycle
- (void)awakeFromNib{
    [super awakeFromNib];
    self.frame = YWKeyWindow.bounds;
    self.previewController = [[QLPreviewController alloc] init];
    self.previewController.dataSource = self;
    self.previewController.delegate = self;
}

-(void)layoutSubviews{
    self.previewController.view.frame = CGRectMake(0, YW_NAV_Hight, YWS_W, YWS_H-YW_NAV_Hight);
    [self addSubview:self.previewController.view];
}

#pragma mark - private methods

#pragma mark - public methods
/** 预览多个文件 单个数组只传一个就好 */
+ (void)previewFileWithPaths:(NSString *)filePath{
    YWFilePreviewView *previewView = [[NSBundle mainBundle] loadNibNamed:@"YWFilePreviewView" owner:nil options:nil].lastObject;
    previewView.filePathArr = @[filePath];
    previewView.frame = CGRectMake(YWS_W, 0, YWS_W, YWS_H);
    [YWKeyWindow addSubview:previewView];
    [UIView animateWithDuration:0.25 animations:^{
        previewView.frame = CGRectMake(0, 0, YWS_W, YWS_H);
    } completion:^(BOOL finished) {
        [previewView.previewController reloadData];
    }];
}


#pragma mark - request methods

#pragma mark - QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return self.filePathArr.count;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSURL *url = [NSURL fileURLWithPath:self.filePathArr[index]];
    return  url;
}

- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing  _Nullable *)view{
    return YWKeyWindow.bounds;
}

#pragma mark - event response
- (IBAction)backButtonClick:(id)sender {
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(YWS_W, 0, YWS_W, YWS_H);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (IBAction)moreButtonClick:(id)sender {
    
    NSLog(@"更多按钮点击");
    
}


#pragma mark - getters and setters

@end
