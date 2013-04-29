//
//  MZViewController.h
//  MZDayPicker
//
//  Created by Michał Zaborowski on 21.04.2013.
//  Copyright (c) 2013 whitecode Michał Zaborowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDayPicker.h"

@interface MZViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MZDayPicker *dayPicker;

@end
