//
//  MultilineCell.h
//  MultilineCellExample
//
//  Created by Phillip Harris on 4/21/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultilineCell : UITableViewCell

@property (nonatomic, strong) UILabel *multilineLabel;

+ (CGFloat)requiredHeightForText:(NSString *)text tableWidth:(CGFloat)tableWidth font:(UIFont *)font edgeInsets:(UIEdgeInsets)edgeInsets;

@end
