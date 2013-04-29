//
//  MZViewController.h
//  MZDayPicker
//
//  Created by Michał Zaborowski on 21.04.2013.
//  Copyright (c) 2013 whitecode Michał Zaborowski. All rights reserved.
//

#import "MZViewController.h"
#import "MZDayPicker.h"

@interface MZViewController () <MZDayPickerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *tableData;
@end

@implementation MZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableData = [@[] mutableCopy];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
	
    MZDayPicker *scroll = [[MZDayPicker alloc] initWithFrame:self.view.bounds dayCellSize:CGSizeMake(64, 64) dayCellFooterHeight:4 month:9 year:2013];
    scroll.delegate = self;
    
    //    scroll.dayNameLabelFontSize = 7.0f;
    //    scroll.dayLabelFontSize = 15.0f;
    [scroll setActiveDaysFrom:5 toDay:20];

    [scroll setCurrentDay:18 animated:YES];
   
    
    [scroll reloadData];
    
    [self.view addSubview:scroll];
    
    self.tableView.frame = CGRectMake(0, scroll.frame.size.height, self.tableView.frame.size.width, self.view.bounds.size.height-scroll.frame.size.height);
    
}


- (void)dayPicker:(MZDayPicker *)dayPicker didSelectDay:(MZDay *)day
{
    NSLog(@"Did select day %@",day.day);
    
    [self.tableData addObject:day];
    [self.tableView reloadData];
}

- (void)dayPicker:(MZDayPicker *)dayPicker willSelectDay:(MZDay *)day
{
    NSLog(@"Will select day %@",day.day);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    MZDay *day = self.tableData[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",day.day];
    cell.detailTextLabel.text = day.name;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
