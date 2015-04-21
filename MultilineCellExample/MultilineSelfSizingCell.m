//
//  MultilineSelfSizingCell.m
//  MultilineCellExample
//
//  Created by Phillip Harris on 4/21/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "MultilineSelfSizingCell.h"

@implementation MultilineSelfSizingCell

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
    
    _multilineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_multilineLabel];
    
    _leftConstraint = [NSLayoutConstraint constraintWithItem:_multilineLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    _rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:_multilineLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    
    [self.contentView addConstraint:_leftConstraint];
    [self.contentView addConstraint:_rightConstraint];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_multilineLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_multilineLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
}

@end
