//
//  MyUITableTableViewController.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "MyUITableTableViewController.h"
#import "Item.h"
#import "MyCellTableViewCell.h"
#import "NSString+Utils.h"
#import "DetailViewController.h"

@interface MyUITableTableViewController ()

@property (strong,nonatomic) NSMutableArray *dataSource;

@end

@implementation MyUITableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void) loadData{
    
    NSArray *receivedData = [Item fetchdata];

    self.dataSource = [[NSMutableArray alloc] init];

    for (Item * item in receivedData) {
     
        [self.dataSource addObject:item];

    }
    
    NSLog(@"Data source = %@", self.dataSource);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier" forIndexPath:indexPath];

    Item *currentItem = self.dataSource[indexPath.row];
    [cell setupcell:currentItem];
    return cell;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
   // NSMutableArray *currentSection = self.dataSource[section];
   // NSString *sectionLetter = @"";
   // if (currentSection.count > 0) {
   //     Person *person = [currentSection firstObject];
   //     sectionLetter =[person.voornaam firstLetterInUpperCase];
   // }
    
   // return sectionLetter;
    
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Item *currentItem = self.dataSource[indexPath.row];
    
    [self performSegueWithIdentifier:@"showDetailsSegue" sender:currentItem];
    NSLog(@"Index Path is %@ ! Seleced is %@", indexPath, currentItem);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Prepare for segue with %@ as sender", sender);
    
    if([segue.identifier isEqualToString:@"showDetailsSegue"]){
        DetailViewController *detailViewController  = [segue destinationViewController];
      
        if ([sender isKindOfClass:[Item class]]) {
            detailViewController.item = sender;
        }
    }
}


@end
