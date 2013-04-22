MZDayPicker
===========

An iOS day picker to allow users to select date

[![](https://raw.github.com/m1entus/MZDayPicker/master/Screens/screen1.png)](https://raw.github.com/m1entus/MZDayPicker/master/Screens/screen1@2x.png)
[![](https://raw.github.com/m1entus/MZDayPicker/master/Screens/animation.gif)](https://raw.github.com/m1entus/MZDayPicker/master/Screens/animation.gif)

## How To Use

Just add MZDayPicker library files to your project and declare MZDayPicker in your controller to conform to the MZDayPicker delegate to recieve callbacks

``` objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];

	MZDayPicker *scroll = [[MZDayPicker alloc] initWithFrame:self.view.bounds dayCellSize:CGSizeMake(64, 64) dayCellFooterHeight:4 month:9 year:2013];

    scroll.delegate = self;
    scroll.currentDay = 15;
    [scroll setActiveDaysFrom:5 toDay:20];

    [self.view addSubview:scroll];
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

## Appearance configuration

``` objective-c

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

```

## Requirements

WCAlertView requires either iOS 5.x and above.

## ARC

WCAlertView uses ARC.

## Contact

[Michal Zaborowski](http://github.com/m1entus) 

