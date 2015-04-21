//
//  MultilineCell.m
//  MultilineCellExample
//
//  Created by Phillip Harris on 4/21/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "MultilineCell.h"

@implementation MultilineCell

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    _multilineLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _multilineLabel.numberOfLines = 0;
    [self.contentView addSubview:_multilineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.contentView.backgroundColor = [UIColor purpleColor];
    NSLog(@"%@", NSStringFromCGRect(self.contentView.frame));
    
    CGRect frame = CGRectMake(self.separatorInset.left, 0.0, CGRectGetWidth(self.contentView.bounds) - 2.0 * self.separatorInset.left, CGRectGetHeight(self.contentView.bounds));
    self.multilineLabel.frame = frame;
}

+ (CGFloat)requiredHeightForText:(NSString *)text tableWidth:(CGFloat)tableWidth font:(UIFont *)font edgeInsets:(UIEdgeInsets)edgeInsets {
    
    CGRect boundingRect = [text boundingRectWithSize:CGSizeMake(tableWidth - edgeInsets.left - edgeInsets.right, FLT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName: font} context:nil];
    
    CGFloat textHeight = ceilf(CGRectGetHeight(boundingRect));
    
    CGFloat totalHeight = edgeInsets.top + textHeight + edgeInsets.bottom;
    
    return totalHeight;
}

@end
