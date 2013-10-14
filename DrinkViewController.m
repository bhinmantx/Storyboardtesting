//
//  DrinkViewController.m
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/7/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "DrinkViewController.h"
#import "Drink.h"
#import "DrinkCell.h"
#import "GamePickerViewController.h"
#import "TutorialDrinkDetailViewController.h"

@interface DrinkViewController () 


@end


@implementation DrinkViewController


@synthesize drinks = _drinks;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.drinks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    static NSString *CellIdentifier = @"DrinkCell";
 //   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
 //Newer code
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrinkCell"];
    Drink *drink = [self.drinks objectAtIndex:indexPath.row];
    cell.textLabel.text = drink.name;
    cell.detailTextLabel.text = drink.description;
   */
   
    
    ////The below code is from tags
    /*
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"DrinkCell"];
	Drink *drink = [self.drinks objectAtIndex:indexPath.row];
	UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
	nameLabel.text = drink.name;
	UILabel *drinkLabel = (UILabel *)[cell viewWithTag:101];
	drinkLabel.text = drink.description;
	UIImageView * ratingImageView = (UIImageView *)
    [cell viewWithTag:102];
	//ratingImageView.image = [self imageForRating:player.rating];
 */
    
   
    DrinkCell *cell = (DrinkCell *)[tableView dequeueReusableCellWithIdentifier:@"DrinkCell"];
    Drink *drink = [self.drinks objectAtIndex:indexPath.row];
    cell.drinkname.text = drink.name;
    cell.description.text = drink.description;
    
    //drink thumbnail
    cell.thumbnail.image = [UIImage imageNamed:drink.thumbnailname];
    

    
    // Configure the cell...
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.drinks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/**
This fires when we press the add button, and the modal view presented (Add drink) is given a pointer to the 
 DrinkviewController as its delegate. Since DrinkViewController implements the adddrinkcontroller delegate protocol this works
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddDrink"])
	{
		UINavigationController *navigationController =
        segue.destinationViewController;
		AddDrinkController *addDrinkViewController =
        [[navigationController viewControllers]
         objectAtIndex:0];
        addDrinkViewController.Thumbnail.image = [UIImage imageNamed:@"amber.png"];
		addDrinkViewController.delegate = self;
        //addDrinkViewController.drinks = _drinks;
	}
    else if ([segue.identifier isEqualToString:@"DrinkDetail"])
    {
        TutorialDrinkDetailViewController *detailViewController = segue.destinationViewController;
       
        //TutorialDrinkDetailViewController *detailViewController = [[navigationController viewControllers] objectAtIndex:0];
     
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        Drink *passedDrink = [self.drinks objectAtIndex:myIndexPath.row];
        detailViewController.drink = passedDrink;
        detailViewController.DrinkName.text = passedDrink.name;
    }
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}



#pragma mark - AddDrinkControllerDelegate

- (void)addDrinkControllerDidCancel:(AddDrinkController *)controller
{
    ////In this case is the "self" the delegatOR?
    
   
	[self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
- (void)addDrinkControllerDidSave:(AddDrinkController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
*/
-(void)addDrinkControllerDidAddDrink:(Drink *)drink{
    [self.drinks addObject:drink];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.drinks count] - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
