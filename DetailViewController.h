//
//  DetailViewController.h
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController

@property (strong,nonatomic) Item *item;
@property (strong, nonatomic) CAGradientLayer *gradient;


@end
