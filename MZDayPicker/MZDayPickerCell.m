//
//  MZDayPickerCell.m
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

#import "MZDayPickerCell.h"

@interface MZDayPickerCell ()
@property (nonatomic,strong) UIView *bottomBorderView;
@property (nonatomic,assign) CGSize cellSize;
@property (nonatomic,assign) CGFloat footerHeight;

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *dayNameLabel;
@end

@implementation MZDayPickerCell

- (void)setBottomBorderSlideHeight:(CGFloat)height
{
    CGRect bottomBorderRect = self.bottomBorderView.frame;
    bottomBorderRect.size.height = height*self.footerHeight;
    self.bottomBorderView.frame = bottomBorderRect;
    
}

- (void)setBottomBorderColor:(UIColor *)color
{
    self.bottomBorderView.backgroundColor = color;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // Use the same color and width as the default cell separator for now
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(ctx, 0.25);
    
    CGContextMoveToPoint(ctx, self.footerHeight, 0);
    CGContextAddLineToPoint(ctx, self.footerHeight, self.bounds.size.height);
    
    CGContextMoveToPoint(ctx, self.footerHeight, 0);
    CGContextAddLineToPoint(ctx, self.cellSize.height+self.footerHeight, 0);
    
    CGContextMoveToPoint(ctx, self.footerHeight, self.bounds.size.height);
    CGContextAddLineToPoint(ctx, self.cellSize.height+self.footerHeight, self.bounds.size.height);
    
    CGContextSetLineWidth(ctx, 0.35);
    
    CGContextMoveToPoint(ctx, self.cellSize.height+self.footerHeight, 0);
    CGContextAddLineToPoint(ctx, self.cellSize.height+self.footerHeight, self.bounds.size.height);
    
    
    CGContextStrokePath(ctx);
    
    [super drawRect:rect];
    
}

- (UITableViewCell *)initWithSize:(CGSize)size footerHeight:(CGFloat)footerHeight reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        if (CGSizeEqualToSize(size, CGSizeZero)) 
            [NSException raise:NSInvalidArgumentException format:@"MZDayPickerCell size can't be zero!"];
         else 
            self.cellSize = size;
        
        self.footerHeight = footerHeight;

        [self applyCellStyle];
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [self initWithSize:CGSizeZero footerHeight:0.0 reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)applyCellStyle
{
    UIView* containingView = [[UIView alloc] initWithFrame:CGRectMake(self.footerHeight, 0, self.cellSize.width, self.cellSize.height)];
    
    self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.cellSize.width, self.cellSize.height)];
    self.dayLabel.center = CGPointMake(containingView.frame.size.width/2, self.cellSize.height/2.6);
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    self.dayLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:self.dayLabel.font.pointSize];
    self.dayLabel.backgroundColor = [UIColor clearColor];
    
    self.dayNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.cellSize.width, self.cellSize.height)];
    self.dayNameLabel.center = CGPointMake(containingView.frame.size.width/2, self.cellSize.height/1.3);
    self.dayNameLabel.textAlignment = NSTextAlignmentCenter;
    self.dayNameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:self.dayNameLabel.font.pointSize];
    self.dayNameLabel.backgroundColor = [UIColor clearColor];
    
    [containingView addSubview: self.dayLabel];
    [containingView addSubview: self.dayNameLabel];
    
    self.containerView = containingView;
    
    UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.cellSize.height, containingView.bounds.size.width, self.footerHeight)];
    
    self.bottomBorderView = bottomBorder;
    [containingView addSubview:bottomBorder];
    
    [containingView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    [self addSubview:containingView];
    
    if (self.cellSize.width != self.cellSize.height) {
        containingView.frame = CGRectMake(self.footerHeight, 0, self.cellSize.height, self.cellSize.width);
    }
}


@end
