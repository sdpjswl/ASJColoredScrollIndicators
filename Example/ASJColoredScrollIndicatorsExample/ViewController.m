//
//  ViewController.m
//  ASJColoredScrollIndicatorsExample
//
//  Created by sudeep on 06/01/16.
//  Copyright © 2016 sudeep. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Radiohead.h"
#import "ASJColoredScrollIndicators.h"

// cell identifiers
static NSString *const kOKComputerCellIdentifier = @"ok_computer_cell_identifier";
static NSString *const kInRainbowsCellIdentifier = @"in_rainbows_cell_identifier";
static NSString *const kRadioheadAlbumsCellIdentifier = @"radiohead_albums_cell_identifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITextView *trueLoveWaitsTextView;
@property (weak, nonatomic) IBOutlet UITableView *okComputerTableView;
@property (weak, nonatomic) IBOutlet UITableView *inRainbowsTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *radioheadAlbumsCollectionView;

@property (readonly, copy, nonatomic) NSArray *okComputerTableData;
@property (readonly, copy, nonatomic) NSArray *inRainbowsTableData;
@property (readonly, copy, nonatomic) NSArray *radioheadAlbumsCollectionViewData;

- (void)setup;
- (void)setupTextView;
- (void)setupTableViews;
- (void)setupCollectionViews;
- (IBAction)flashIndicators:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setup];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setup
{
  self.automaticallyAdjustsScrollViewInsets = NO;
  [self setupTextView];
  [self setupTableViews];
  [self setupCollectionViews];
}

- (void)setupTextView
{
  _trueLoveWaitsTextView.editable = NO;
  _trueLoveWaitsTextView.selectable = NO;
  _trueLoveWaitsTextView.backgroundColor = [UIColor trueLoveWaitsBackgroundColor];
  _trueLoveWaitsTextView.scrollIndicatorColor = [UIColor trueLoveWaitsIndicatorColor];
}

- (void)setupTableViews
{
  _okComputerTableView.tag = 0;
  _okComputerTableView.backgroundColor = [UIColor okComputerTableBackgroundColor];
  _okComputerTableView.scrollIndicatorColor = [UIColor okComputerIndicatorColor];
  [_okComputerTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kOKComputerCellIdentifier];
  
  _inRainbowsTableView.tag = 1;
  _inRainbowsTableView.backgroundColor = [UIColor inRainbowsTableBackgroundColor];
  _inRainbowsTableView.scrollIndicatorColor = [UIColor inRainbowsIndicatorColor];
  [_inRainbowsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kInRainbowsCellIdentifier];
}

- (void)setupCollectionViews
{
  _radioheadAlbumsCollectionView.backgroundColor = [UIColor radioheadAlbumsBackgroundColor];
  _radioheadAlbumsCollectionView.scrollIndicatorColor = [UIColor radioheadAlbumsIndicatorColor];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (!tableView.tag) {
    return self.okComputerTableData.count;
  }
  return self.inRainbowsTableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = nil;
  
  if (tableView.tag == 0)
  {
    cell = [tableView dequeueReusableCellWithIdentifier:kOKComputerCellIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor okComputerIndicatorColor];
    cell.textLabel.text = self.okComputerTableData[indexPath.row];
  }
  else
  {
    cell = [tableView dequeueReusableCellWithIdentifier:kInRainbowsCellIdentifier forIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor inRainbowsIndicatorColor];
    cell.textLabel.text = self.inRainbowsTableData[indexPath.row];
  }
  
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.backgroundColor = [UIColor clearColor];
  cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
  
  return cell;
}

#pragma mark - Table data properties

- (NSArray *)okComputerTableData
{
  return @[@"Airbag",
           @"Paranoid Android",
           @"Subterranean Homesick Alien",
           @"Exit Music (For a Film)",
           @"Let Down",
           @"Karma Police",
           @"Fitter Happier",
           @"Electioneering",
           @"Climbing Up the Walls",
           @"No Surprises",
           @"Lucky",
           @"The Tourist"];
}

- (NSArray *)inRainbowsTableData
{
  return @[@"15 Step",
           @"Bodysnatchers",
           @"Nude",
           @"Weird Fishes / Arpeggi",
           @"All I Need",
           @"Faust Arp",
           @"Reckoner",
           @"House of Cards",
           @"Jigsaw Falling Into Place",
           @"Videotape"];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 33.0f;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.radioheadAlbumsCollectionViewData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRadioheadAlbumsCellIdentifier forIndexPath:indexPath];
  
  UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
  NSString *imageName = self.radioheadAlbumsCollectionViewData[indexPath.row];
  imageView.image = [UIImage imageNamed:imageName];
  
  return cell;
}

- (NSArray *)radioheadAlbumsCollectionViewData
{
  return @[@"pablo_honey",
           @"the_bends",
           @"ok_computer",
           @"kid_a",
           @"amnesiac",
           @"hail_to_the_thief",
           @"in_rainbows",
           @"the_king_of_limbs",
           @"a_moon_shaped_pool",
           @"logo"];
}

#pragma mark - IBAction

- (IBAction)flashIndicators:(id)sender
{
  [_trueLoveWaitsTextView flashScrollIndicators];
  [_okComputerTableView flashScrollIndicators];
  [_inRainbowsTableView flashScrollIndicators];
  [_radioheadAlbumsCollectionView flashScrollIndicators];
}

@end
