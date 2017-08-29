//
//  TestViewModel.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：viewModel
 作用：放置相关逻辑(业务,视图显示)及网络请求
 */
#import <Foundation/Foundation.h>
#import "TestViewModel.h"
#import "TestModel.h"

//网络请求回调
typedef void (^callback) (NSArray<TestModel *> *models);
//跳转回调
typedef void(^GoToVC)(TestEnum testEnum);
@interface TestViewModel : NSObject

/* 模型数组 */
@property (copy, nonatomic) NSArray<TestModel *> *models;
/* 第几行（因为是view是cell） */
@property (assign, nonatomic) NSInteger row;
/* 跳转控制器回调 */
@property (copy, nonatomic) GoToVC goToVC;

//根据参数跳转
- (void)gotoNextVCWithViewModel:(TestViewModel *)viewModel;
//tableView头部刷新的网络请求
- (void)headerRefreshRequestWithCallback:(callback)callback;
//tableView底部刷新的网络请求
- (void)footerRefreshRequestWithCallback:(callback)callback;

@end
