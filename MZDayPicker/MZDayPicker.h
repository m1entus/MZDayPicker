//
//  MZDayPicker.h
//  MZDayPicker
//
//  Created by Michał Zaborowski on 18.04.2013.
//  Copyright (c) 2013 whitecode. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "MZDay.h"

@class MZDayPicker;
@class MZDayPickerCell;

@protocol MZDayPickerDataSource <NSObject>
@optional
- (NSString *)dayPicker:(MZDayPicker *)dayPicker titleForCellDayLabelInDay:(MZDay *)day;
- (NSString *)dayPicker:(MZDayPicker *)dayPicker titleForCellDayNameLabelInDay:(MZDay *)day;

@end

@protocol MZDayPickerDelegate <NSObject>
@optional
- (void)dayPicker:(MZDayPicker *)dayPicker scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)dayPicker:(MZDayPicker *)dayPicker scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (void)dayPicker:(MZDayPicker *)dayPicker scrollViewDidEndDragging:(UIScrollView *)scrollView;

- (void)dayPicker:(MZDayPicker *)dayPicker willSelectDay:(MZDay *)day;
- (void)dayPicker:(MZDayPicker *)dayPicker didSelectDay:(MZDay *)day;

@end

@interface MZDayPicker : UIView

/* Customization optional (optional) */
@property (nonatomic, strong) UIColor *activeDayColor;
@property (nonatomic, strong) UIColor *activeDayNameColor;
@property (nonatomic, strong) UIColor *inactiveDayColor;

@property (nonatomic, strong) UIColor *backgroundPickerColor;
@property (nonatomic, strong) UIColor *bottomBorderColor;

/* Day number and name font size (optional) */
@property (nonatomic, assign) CGFloat dayLabelFontSize;
@property (nonatomic, assign) CGFloat dayNameLabelFontSize;

/* Day number zoom scale (optional) */
@property (nonatomic, assign) CGFloat dayLabelZoomScale;

@property (nonatomic, readonly) CGSize dayCellSize;
@property (nonatomic, readonly) CGFloat dayCellFooterHeight;

@property (nonatomic, readonly) NSRange activeDays;

@property (nonatomic, assign) NSInteger currentDay;

@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger year;

@property (nonatomic, weak) id<MZDayPickerDelegate> delegate;
@property (nonatomic, weak) id<MZDayPickerDataSource> dataSource;

- (id)initWithFrame:(CGRect)frame dayCellSize:(CGSize)cellSize dayCellFooterHeight:(CGFloat)footerHeight;
- (id)initWithFrame:(CGRect)frame dayCellSize:(CGSize)cellSize dayCellFooterHeight:(CGFloat)footerHeight month:(NSInteger)month year:(NSInteger)year;
- (id)initWithFrame:(CGRect)frame month:(NSInteger)month year:(NSInteger)year;

// Set active days for current month
- (void)setActiveDaysFrom:(NSInteger)fromDay toDay:(NSInteger)toDay;

- (void)setCurrentDay:(NSInteger)currentDay animated:(BOOL)animated;

- (void)reloadData;
- (MZDayPickerCell *)cellForDay:(MZDay *)day;

@end

