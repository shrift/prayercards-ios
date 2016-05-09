//
//  CardListViewController.m
//  mwprayercards
//
//  Created by Steve Kim on 2012/02/02.
//  Copyright (c) 2012 Kobukson Studio LLC. All rights reserved.
//

#import "CardListViewController.h"
#import "CardViewController.h"
#import "CardCell.h"
#import "SplashViewController.h"
#import "AboutViewController.h"
#import "AppDelegate.h"
#import "DataSource.h"

@implementation CardListViewController

@synthesize myTable;
@synthesize tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Prayer Cards", @"Prayer Cards");
        self.tabBarItem.image = [UIImage imageNamed:@"icon_card"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // After this line: [window addSubview:tabBarController.view];
    
    self.tableData = [DataSource sharedDataSource].cards;
        
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}






#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [tableData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CardCell";
    
    CardCell *cell = (CardCell*) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (indexPath.row==0) {
        
        if (cell == nil) {
            UIViewController* dummy = [[UIViewController alloc] initWithNibName:@"CardCell" bundle:nil];
            cell = (CardCell*) dummy.view;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        // Configure the cell...
        NSMutableDictionary* info = [tableData objectAtIndex:indexPath.row];
        [(CardCell*) cell setCellData:info];
        [(CardCell*) cell renderCell];
    }
    else {
        
        if (cell == nil) {
            UIViewController* dummy = [[UIViewController alloc] initWithNibName:@"CardCell" bundle:nil];
            cell = (CardCell*) dummy.view;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
        // Configure the cell...
        NSMutableDictionary* info = [tableData objectAtIndex:indexPath.row];
        [(CardCell*) cell setCellData:info];
        [(CardCell*) cell renderCell];
    }
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}



/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 [originalTableData removeObjectAtIndex:indexPath.row];
 [tableData removeObjectAtIndex:indexPath.row];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CardViewController* cardViewController = [[CardViewController alloc] initWithNibName:@"CardViewController" bundle:nil];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    NSMutableDictionary* d = [tableData objectAtIndex:indexPath.row];
    cardViewController.card = d;
    [DataSource sharedDataSource].cardIndex = indexPath.row;
    
    [self.navigationController pushViewController:cardViewController animated:YES];
	
     [myTable deselectRowAtIndexPath:indexPath animated:YES];	
     
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0f;
}



@end
