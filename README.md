# YWFilePreviewDemo
# iOS QLPreviewController 文件预览

官方SDK提供了一个QLPreviewController，使用它就可以让我们的App在iPhone/iPad中直接预览各个文件了。官方的开发文档中说明其支持的文件类型有：

iWork文档
微软Office97以上版本的文档
RTF文档
PDF文件
图片文件
文本文件和CSV文件

###使用方法
```
//1.创建
QLPreviewController *previewController = [[QLPreviewController alloc] init];
//2.设置代理
previewController.dataSource = self;
previewController.delegate = self;
//3.实现代理
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
   //返回当前预览文件的个数
    return self.filePathArr.count;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSURL *url = [NSURL fileURLWithPath:self.filePathArr[index]];
    //返回每一个要预览的文件的地址
    return  url;
}

//4.跳转
 [self presentViewController:previewController.dataSource animated:YES completion:nil];

```

###封装
为了在项目过程中使用方便，作了简单的封装
#### 多文件预览封装
######用到的类 YWFilePreviewController
######API
```
/** 预览多个文件 单个文件时数组传一个 */
- (void)previewFileWithPaths:(NSArray <NSString *>*)filePathArr on:(UIViewController *)vc jump:(YWJumpMode)jump;

/** 将要退出 */
- (void)setWillDismissBlock:(void (^)())willDismissBlock;

/** 已经退出 */
- (void)setDidDismissBlock:(void (^)())didDismissBlock;

/** 将要访问文件中的Url回调  BOOL 是否允许访问*/
- (void)setShouldOpenUrlBlock:(BOOL (^)(NSURL *, id<QLPreviewItem>))shouldOpenUrlBlock;
```
######调用
```
NSArray *filePathArr = @[filePath2,filePath1, filePath3, filePath4, filePath5];
    
    YWFilePreviewController *_filePreview = [[YWFilePreviewController alloc] init];

    [_filePreview previewFileWithPaths:filePathArr on:self jump:YWJumpPresentAnimat];
```

#### 单文件快速预览封装
######用到的类 YWFilePreviewView
######API
```
/** 快速预览单个文件 */
+ (void)previewFileWithPaths:(NSString *)filePath;
```
######调用
```
[YWFilePreviewView previewFileWithPaths:filePath4];
```


