//
//  DetailViewController.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelWage;
@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // CAGradientLayer *gradient = [CAGradientLayer layer];
   // gradient.frame = self.view.bounds;
   // gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
   // [self.view.layer insertSublayer:gradient atIndex:0];
    
    
  //  NSLog(@"Detailview has loaded with person %@", _person);
    _labelName.textAlignment = NSTextAlignmentCenter;
    _labelName.text = _item.title;
    
    _labelWage.text = [NSString stringWithFormat:@"%ld",(long)_item.price];
    _stepper.value = _item.price;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.gradient = [CAGradientLayer layer];
    self.gradient.frame = self.view.bounds;
    self.gradient.colors = @[(id)[UIColor purpleColor].CGColor,
                             (id)[UIColor redColor].CGColor];
    
    [self.view.layer insertSublayer:self.gradient atIndex:0];
    
    [self animateLayer];
}

-(void)animateLayer
{
    
    NSArray *fromColors = self.gradient.colors;
    NSArray *toColors = @[(id)[UIColor blueColor].CGColor,
                          (id)[UIColor greenColor].CGColor];
    
    [self.gradient setColors:toColors];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.fromValue             = fromColors;
    animation.toValue               = toColors;
    animation.duration              = 30.00;
    animation.removedOnCompletion   = NO;
    animation.fillMode              = kCAFillModeForwards;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate              = self;
    
    // Add the animation to our layer
    
    [self.gradient addAnimation:animation forKey:@"animateGradient"];
}


- (IBAction)stepperValueChanged:(UIStepper *)sender{
    _item.price = _stepper.value;
     _labelWage.text = [NSString stringWithFormat:@"%ld",(long)_item.price];
    
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
