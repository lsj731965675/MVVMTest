//
//  TestCell.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

#import "TestCell.h"

@interface TestCell ()

/* title */
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation TestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
        [self.contentView addSubview:_titleLabel];
        _titleLabel.backgroundColor=[UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

//数据填充
- (void)setViewModel:(TestViewModel *)viewModel {
    _viewModel = viewModel;
    NSArray<TestModel *> *models = viewModel.models;
    NSInteger row = viewModel.row;
    _titleLabel.text = models[row].title;
}


@end
