//
//  MyUITableTableViewController.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "MyUITableTableViewController.h"
#import "Person.h"
#import "MyCellTableViewCell.h"
#import "NSString+Utils.h"
#import "DetailViewController.h"

@interface MyUITableTableViewController ()

@property (strong,nonatomic) NSMutableArray *dataSource;

@end

@implementation MyUITableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
        
    [self loadData];
    
   
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


-(void) loadData{
    
    NSArray *receivedData = [Person fetchpeople];
    
    //1) Sort the data
    NSSortDescriptor *fnameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"voornaam"                                             ascending:YES];
     NSSortDescriptor * lnameSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"achternaam"                                             ascending:YES];
    receivedData = [receivedData sortedArrayUsingDescriptors:@[fnameSortDescriptor, lnameSortDescriptor]];
    
    
    //2) Initialize
    self.dataSource = [[NSMutableArray alloc] init];
    NSMutableArray *currentLetterSection= [[NSMutableArray alloc]init];
    [self.dataSource addObject:currentLetterSection];
    
    NSString * currentLetter = @"";
    if ([receivedData count] > 0) {
        Person *firstPerson = [receivedData firstObject];
        currentLetter = [firstPerson.voornaam firstLetterInUpperCase];
    }
    
    for (Person * person in receivedData) {
        NSString *personLetter = [person.voornaam firstLetterInUpperCase];
        if ([personLetter isEqualToString:currentLetter]) {
            [currentLetterSection addObject:person];
        } else {
            currentLetter = personLetter;
            currentLetterSection= [[NSMutableArray alloc]init];
            [self.dataSource addObject:currentLetterSection];
            [currentLetterSection addObject:person];
        }
        
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
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.dataSource[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier" forIndexPath:indexPath];
    //tableView.dataSource
  //  cell.textLabel.text = []
    // Configure the cell...
    NSArray *currentSection =  self.dataSource[indexPath.section];
    Person *currentPerson = currentSection[indexPath.row];
    [cell setupcell:currentPerson];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSMutableArray *currentSection = self.dataSource[section];
    NSString *sectionLetter = @"";
    if (currentSection.count > 0) {
        Person *person = [currentSection firstObject];
        sectionLetter =[person.voornaam firstLetterInUpperCase];
    }
    
    return sectionLetter;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *currentSection =  self.dataSource[indexPath.section];
    Person *currentPerson = currentSection[indexPath.row];
    
    [self performSegueWithIdentifier:@"showDetailsSegue" sender:currentPerson];
    NSLog(@"Index Path is %@ ! Seleced is %@", indexPath, currentPerson);
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
      
        if ([sender isKindOfClass:[Person class]]) {
            detailViewController.person = sender;
        }
    }
}


@end
