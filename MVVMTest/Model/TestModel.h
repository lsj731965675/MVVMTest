//
//  TestModel.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：模型
 作用：数据模型
 */
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TestEnum) {
    TestA = 0,
    TestB = 1,
    TestC = 2
};

@interface TestModel : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) TestEnum testEnum;
@end
