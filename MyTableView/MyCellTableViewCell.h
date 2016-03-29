//
//  MyCellTableViewCell.h
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface MyCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *firstnamelabel;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *wageLabel;

-(void) setupcell :(Person *)person;

@end
