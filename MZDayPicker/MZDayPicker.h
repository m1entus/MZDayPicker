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

/* 
 * Font colors (optional)
 */
@property (nonatomic, strong) UIColor *activeDayColor;
@property (nonatomic, strong) UIColor *activeDayNameColor;
@property (nonatomic, strong) UIColor *inactiveDayColor;

/*
 * Picker background color (optional)
 */
@property (nonatomic, strong) UIColor *backgroundPickerColor;

/*
 * Property for cell footer color (optional)
 */
@property (nonatomic, strong) UIColor *bottomBorderColor;

/* Day number and name font size (optional) */
@property (nonatomic, assign) CGFloat dayLabelFontSize;
@property (nonatomic, assign) CGFloat dayNameLabelFontSize;

/* Day number zoom scale (optional) */
@property (nonatomic, assign) CGFloat dayLabelZoomScale;

@property (nonatomic, readonly) CGSize dayCellSize;
@property (nonatomic, readonly) CGFloat dayCellFooterHeight;

/*
 * If you want to set activeDay range, use method: setActiveDaysFrom:toDay: 
 */
@property (nonatomic, readonly) NSRange activeDays;

/*
 * Property for current month, year, day
 */
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger currentDay;

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, weak) id<MZDayPickerDelegate> delegate;
@property (nonatomic, weak) id<MZDayPickerDataSource> dataSource;

/*
 * Initializers
 * MZDayPicker supports storyboard
 */
- (instancetype)initWithFrame:(CGRect)frame dayCellSize:(CGSize)cellSize dayCellFooterHeight:(CGFloat)footerHeight;
- (instancetype)initWithFrame:(CGRect)frame dayCellSize:(CGSize)cellSize dayCellFooterHeight:(CGFloat)footerHeight month:(NSInteger)month year:(NSInteger)year;
- (instancetype)initWithFrame:(CGRect)frame month:(NSInteger)month year:(NSInteger)year;

/*
 * Setter for active days range
 */
- (void)setActiveDaysFrom:(NSInteger)fromDay toDay:(NSInteger)toDay;

/*
 * Set picker date range
 */
- (void)setStartDate:(NSDate *)date endDate:(NSDate *)endDate;

/*
 * Setter for currentDay
 */
- (void)setCurrentDay:(NSInteger)currentDay animated:(BOOL)animated;

/*
 * Setter for currentDate
 */
- (void)setCurrentDate:(NSDate *)date animated:(BOOL)animated;

/*
 * Reload dataSource and setup scrollview content
 */
- (void)reloadData;

/*
 * Cell for MZDay object
 */
- (MZDayPickerCell *)cellForDay:(MZDay *)day;

@end

@interface NSDate (Additional)
+ (NSDate *)dateFromDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;
+ (NSDate *)dateWithNoTime:(NSDate *)dateTime middleDay:(BOOL)middle;
- (NSUInteger)numberOfDaysInMonth;
@end

