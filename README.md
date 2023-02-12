MZDayPicker
===========

The MZDayPicker is a library written in Objective-C which allows users to 
select various dates from an integrated GUI and add them to a displayed 
list. It is designed for iOS and can be integrated into user generated 
applications. 

## Why this Project?

This project was created so that users could easily integrate a date 
selection component into applications that they may be developing. It 
supports storyboard functionality in iOS development, meaning that it can 
be readily added to the interface and connection screens seen in Xcode. As 
a result, it is simple to use and connect with exisiting applications, 
unlike many libraries which already exist for this feature set.

## Additional Features
In addition to the base day picker functionality detailed above, there are 
a few other integrated features which were included with the user in mind. 
Firstly, users can set a start and end date range rather than manually 
selecting desired dates. Additionally, users can select font colors, 
background colors, cell colors, and change font sizes all so that the 
MZDayPicker storyboard matches the visual theme of the application in 
development by the user.

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



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/m1entus/mzdaypicker/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

