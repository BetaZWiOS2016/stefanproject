//
//  DetailViewController.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelWage;
@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Detailview has loaded with person %@", _person);
    _labelName.textAlignment = NSTextAlignmentCenter;
    _labelName.text = _person.volledigenaam;
    
    _labelWage.text = [NSString stringWithFormat:@"%ld",(long)_person.wage];
    _stepper.value = _person.wage;
}

- (IBAction)stepperValueChanged:(UIStepper *)sender{
    _person.wage = _stepper.value;
  _labelWage.text = [NSString stringWithFormat:@"%ld",(long)_person.wage];
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
