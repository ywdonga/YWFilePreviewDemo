//
//  ViewController.m
//  YWFilePreviewDemo
//
//  Created by dyw on 2017/3/16.
//  Copyright © 2017年 dyw. All rights reserved.
//

#import "ViewController.h"
#import "YWFilePreviewController.h"
#import "YWFilePreviewView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
}


- (IBAction)filePreviewButtonClick:(id)sender {
    
    NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"1.xlsx" ofType:nil ];
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"2.docx" ofType:nil ];
    NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"3.ppt" ofType:nil ];
    NSString *filePath4 = [[NSBundle mainBundle] pathForResource:@"4.pdf" ofType:nil ];
    NSString *filePath5 = [[NSBundle mainBundle] pathForResource:@"5.png" ofType:nil ];
    
    NSArray *filePathArr = @[filePath2,filePath1, filePath3, filePath4, filePath5];
    
    YWFilePreviewController *_filePreview = [[YWFilePreviewController alloc] init];

    [_filePreview previewFileWithPaths:filePathArr on:self jump:YWJumpPresentAnimat];
}

- (IBAction)filePreviewSimpleness:(id)sender {
    NSString *filePath4 = [[NSBundle mainBundle] pathForResource:@"4.pdf" ofType:nil ];

    [YWFilePreviewView previewFileWithPaths:filePath4];
    
}

@end
