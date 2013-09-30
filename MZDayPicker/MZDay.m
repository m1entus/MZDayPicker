//
//  MZDay.h
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

#import "MZDay.h"

static NSCalendar *gregorianCalendar;
static NSArray *monthNames;
static NSArray *monthShortNames;

@implementation MZDay

+ (void)initialize
{
	if (self == [MZDay class]) {
		monthNames = @[NSLocalizedString(@"January", nil),
					   NSLocalizedString(@"February", nil),
					   NSLocalizedString(@"March", nil),
					   NSLocalizedString(@"April", nil),
					   NSLocalizedString(@"May", nil),
					   NSLocalizedString(@"June", nil),
					   NSLocalizedString(@"July", nil),
					   NSLocalizedString(@"August", nil),
					   NSLocalizedString(@"September", nil),
					   NSLocalizedString(@"October", nil),
					   NSLocalizedString(@"November", nil),
					   NSLocalizedString(@"December", nil)];

		monthShortNames = @[NSLocalizedString(@"Jan", nil),
							NSLocalizedString(@"Feb", nil),
							NSLocalizedString(@"Mar", nil),
							NSLocalizedString(@"Apr", nil),
							NSLocalizedString(@"May", nil),
							NSLocalizedString(@"Jun", nil),
							NSLocalizedString(@"Jul", nil),
							NSLocalizedString(@"Aug", nil),
							NSLocalizedString(@"Sep", nil),
							NSLocalizedString(@"Oct", nil),
							NSLocalizedString(@"Nov", nil),
							NSLocalizedString(@"Dec", nil)];
	}
}

- (NSDateComponents *)dateComponents
{
	if (gregorianCalendar == nil) {
		gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		[gregorianCalendar setLocale:[NSLocale currentLocale]];
	}
	return [gregorianCalendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self.date];
}

- (NSNumber *)day
{
	if (_day == nil && _date != nil) {
		NSDateComponents *dateComponents = [self dateComponents];
		_day = @(dateComponents.day);
	}
	return _day;
}

- (NSNumber *)month
{
	if (_month == nil && _date != nil) {
		NSDateComponents *dateComponents = [self dateComponents];
		_month = @(dateComponents.month);
	}
	return _month;
}

- (NSString *)monthName
{
	return [monthNames objectAtIndex:[self.month unsignedIntegerValue]-1];
}

- (NSString *)monthShortName
{
	return [monthShortNames objectAtIndex:[self.month unsignedIntegerValue]-1];
}

- (NSNumber *)year
{
	if (_year == nil && _date != nil) {
		NSDateComponents *dateComponents = [self dateComponents];
		_year = @(dateComponents.year);
	}
	return _year;
}

@end
