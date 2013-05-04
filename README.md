MZDayPicker
===========

An iOS day picker to allow users to select date

[![](https://raw.github.com/m1entus/MZDayPicker/master/Screens/screen1.png)](https://raw.github.com/m1entus/MZDayPicker/master/Screens/screen1@2x.png)
[![](https://raw.github.com/m1entus/MZDayPicker/master/Screens/animation.gif)](https://raw.github.com/m1entus/MZDayPicker/master/Screens/animation.gif)

## How To Use

Just add MZDayPicker library files to your project and setup MZDayPicker in storyboard and IBOutlet to your controller to conform to the MZDayPicker delegate to recieve callbacks

``` objective-c
@property (weak, nonatomic) IBOutlet MZDayPicker *dayPicker;
```

You can setup picker using current month:

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];

	self.dayPicker.month = 9;
    self.dayPicker.year = 2013;

    self.dayPicker.delegate = self;
    
    self.dayPicker.dayNameLabelFontSize = 7.0f;
    self.dayPicker.dayLabelFontSize = 15.0f;
    [self.dayPicker setActiveDaysFrom:1 toDay:30];

    [self.dayPicker setCurrentDay:15 animated:NO];
}
```
You can also setup start and end date range:

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];

    ...

    [self.dayPicker setStartDate:[NSDate dateFromDay:28 month:9 year:2013] endDate:[NSDate dateFromDay:5 month:10 year:2013]];
    
    [self.dayPicker setCurrentDate:[NSDate dateFromDay:3 month:10 year:2013] animated:NO];
}
```

Implement the optional delegate method to be notified when a new day item is selected

``` objective-c

- (void)dayPicker:(MZDayPicker *)dayPicker willSelectDay:(MZDay *)day
{
    NSLog(@"Will select day %@",day.day);
}

- (void)dayPicker:(MZDayPicker *)dayPicker didSelectDay:(MZDay *)day
{
    NSLog(@"Did select day %@",day.day);
    
    [self.tableData addObject:day];
    [self.tableView reloadData];
}

```

## Delegates

``` objective-c
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
```

## Appearance configuration

``` objective-c

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

```

## Requirements

MZDayPicker requires either iOS 5.x and above.

## Storyboard

MZDayPicker supports storyboard.

## ARC

MZDayPicker uses ARC.

## Contact

[Michal Zaborowski](http://github.com/m1entus) 

