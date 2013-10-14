//
//  AddDrinkController.m
//  StoryBoardTesting
//
//  Created by Brendan Hinman on 10/9/13.
//  Copyright (c) 2013 Brendan Hinman. All rights reserved.
//

#import "AddDrinkController.h"
#import "Drink.h"

@interface AddDrinkController ()

@end

@implementation AddDrinkController{
    NSString *game;
    NSString *description;
}

@synthesize delegate;
@synthesize gameNameField;
@synthesize Thumbnail;
@synthesize ThumbNailName;
@synthesize descriptionField;
@synthesize thumbnailPicker = _thumbNailPicker;
@synthesize thumbNailNames = _thumbNailNames;

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
    
    _thumbNailPicker.delegate = self;
    _thumbNailPicker.dataSource = self;
    
    _thumbNailNames = [NSMutableArray arrayWithCapacity:10];
    
    [_thumbNailNames addObject:@"amber.png"];
    [_thumbNailNames addObject:@"orange.png"];
    [_thumbNailNames addObject:@"black.png"];
    [_thumbNailNames addObject:@"gold.png"];
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

///////Default value being set

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		NSLog(@"init AddDrinkController");
        game = @"amber.png";
        
        ThumbNailName.text = game;
	//	game = @"Chess";
    //    gameNameField.text = @"Chess";
	}
	return self;
}



////We're using static cells so no data source needed
/*
#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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



-(IBAction)cancel:(id)sender
{
    [self.delegate addDrinkControllerDidCancel:self];
}

-(IBAction)done:(id)sender
{
    Drink *drink = [[Drink alloc] init];
    drink.name = self.nameTextField.text;
    //drink.description = @"A description";
    drink.thumbnailname = game;
    drink.description = descriptionField.text;
  //  [self.delegate AddDrinkController:self didAddDrink:drink];
    [self.delegate addDrinkControllerDidAddDrink:drink];
//    [self.delegate addDrinkControllerDidSave:self];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
        [self.nameTextField becomeFirstResponder];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark - Pickerview Data Source
/**
 This controls the thumbnail picker
 */
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   // return [_drinks count];
    return [_thumbNailNames count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

#pragma mark - PickerView Delegate


-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
 

  /*  CGRect cellFrame = CGRectMake(0.0, 0.0, 110.0, 32.0);
    UIView *newView = [[UIView alloc] initWithFrame:cellFrame];
    newView.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
    return newView;
    */

    NSArray * nibs = [[NSBundle mainBundle] loadNibNamed:@"ThumbPickerCell" owner:self options:nil];
  
    ///This should be the top level view.
    
    UIView *newView = [nibs objectAtIndex:0];
 
    UIImageView *thumb = (UIImageView*)[newView viewWithTag:50];
/*
    NSLog(@"%@ Nibs's count %x", @"This fired", nibs.count);

    if(row == 0)
    thumb.image = [UIImage imageNamed:@"gold.png"];
    else
        thumb.image = [UIImage imageNamed:@"amber.png"];
    
    //view = newView;
  
 */
    thumb.image = [UIImage imageNamed:[_thumbNailNames objectAtIndex:row]];
 return newView;

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
return 60.0;
}



#pragma mark - Gamepickerviewdelegate


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickImage"])
    {
            NSLog(@"%@", @"About to do the segue");
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = game;
    }
        
}

- (void)gamePickerViewController:
(GamePickerViewController *)controller
                   didSelectGame:(NSString *)theGame
{
	game = theGame;
	//self.gameNameField.text = game;
    self.ThumbNailName.text = game;
    self.Thumbnail.image = [UIImage imageNamed:game];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
