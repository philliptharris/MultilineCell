//
//  MultilineSelfSizingCell.h
//  MultilineCellExample
//
//  Created by Phillip Harris on 4/21/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultilineSelfSizingCell : UITableViewCell

@property (nonatomic, strong) UILabel *multilineLabel;

@property (nonatomic, strong) NSLayoutConstraint *leftConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightConstraint;

@end
