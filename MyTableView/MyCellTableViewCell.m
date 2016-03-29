//
//  MyCellTableViewCell.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "MyCellTableViewCell.h"

@implementation MyCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    
    // Configure the view for the selected state
}
-(void) setupcell:(Person *)person{
    self.firstnamelabel.text = person.voornaam;
    self.lastNameLabel.text = person.achternaam;
    self.wageLabel.text = [NSString stringWithFormat:@"%ld",(long)person.wage];
}

@end
