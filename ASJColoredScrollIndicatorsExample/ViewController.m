//
//  ViewController.m
//  ASJColoredScrollIndicatorsExample
//
//  Created by sudeep on 06/01/16.
//  Copyright © 2016 sudeep. All rights reserved.
//

#import "ViewController.h"
#import "ASJTableView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ASJTableView *customTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [_customTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  cell.textLabel.text = [NSString stringWithFormat:@"Row %ld", (long)indexPath.row];
  return cell;
}

@end
