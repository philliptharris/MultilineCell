//
//  MyTableViewController.m
//  MultilineCellExample
//
//  Created by Phillip Harris on 4/21/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "MyTableViewController.h"

#import "MultilineCell.h"

@interface MyTableViewController ()

@property (nonatomic, strong) NSArray *texts;
@property (nonatomic, strong) UIFont *font;

@end

@implementation MyTableViewController

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    _texts = @[@"test\ntest\ntest", @"test", @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
    _font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

//===============================================
#pragma mark -
#pragma mark View Methods
//===============================================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)didChangePreferredContentSize:(NSNotification *)notification {
    self.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [self.tableView setNeedsLayout];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//===============================================
#pragma mark -
#pragma mark UITableView
//===============================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.texts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MultilineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[MultilineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.multilineLabel.font = self.font;
    NSString *text = self.texts[indexPath.row];
    cell.multilineLabel.text = text;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *text = self.texts[indexPath.row];
    CGFloat height = [MultilineCell requiredHeightForText:text tableWidth:CGRectGetWidth(tableView.bounds) - 34.0 font:self.font edgeInsets:UIEdgeInsetsMake(10.0, self.tableView.separatorInset.left, 10.0, self.tableView.separatorInset.left)];
    return MAX(44.0, height);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
