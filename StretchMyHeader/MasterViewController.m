//
//  MasterViewController.m
//  StretchMyHeader
//
//  Created by Abegael Jackson on 2015-06-09.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "PreviewCell.h"

@interface MasterViewController ()<UIScrollViewDelegate>

@property NSMutableArray *newsItemArray;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *tableHeader;
@end

@implementation MasterViewController

static const int kTableHeaderHeight = 300;


- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden: YES animated:YES];
    
    self.tableView.estimatedRowHeight = 60.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    self.dateLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    
    [self updateHeaderView];
    
    [self setNewsItemArray];
    
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self updateHeaderView];
}

-(void)updateHeaderView{
    
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.tableHeader];
    
    NSLog(@"%f",self.tableView.contentOffset.y);
    
    [self.tableView setContentInset:UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)];
    CGRect frame = self.tableHeader.frame;
    frame.origin.y = self.tableView.contentOffset.y;
    self.tableHeader.frame = frame;
    
    if (self.tableView.contentOffset.y < 0) {
        CGRect frame = self.tableHeader.frame;
        frame.origin.y = self.tableView.contentOffset.y;
        frame.size.height = 0 - self.tableView.contentOffset.y;
        self.tableHeader.frame = frame;
    }
}


- (void)setNewsItemArray {
    NewsItem *news01 = [[NewsItem alloc]initWithCategory:@"World" andHeadline:@"Climate change protests, divestments meet fossil fuels realities"];
    NewsItem *news02 = [[NewsItem alloc]initWithCategory:@"Europe" andHeadline:@"Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"];
    NewsItem *news03 = [[NewsItem alloc]initWithCategory:@"Middle East" andHeadline:@"Airstrikes boost Islamic State, FBI director warns more hostages possible"];
    NewsItem *news04 = [[NewsItem alloc]initWithCategory:@"Africa" andHeadline:@"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"];
    NewsItem *news05 = [[NewsItem alloc]initWithCategory:@"Asia Pacific" andHeadline:@"Despite UN ruling, Japan seeks backing for whale hunting"];
    NewsItem *news06 = [[NewsItem alloc]initWithCategory:@"Americas" andHeadline:@"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"];
    NewsItem *news07 = [[NewsItem alloc]initWithCategory:@"World" andHeadline:@"South Africa in $40 billion deal for Russian nuclear reactors"];
    NewsItem *news08 = [[NewsItem alloc]initWithCategory:@"Europe" andHeadline:@"'One million babies' created by EU student exchanges"];
    
    
    self.newsItemArray = [NSMutableArray arrayWithObjects:news01, news02, news03, news04, news05, news06, news07, news08, nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.newsItemArray) {
        self.newsItemArray = [[NSMutableArray alloc] init];
    }
    [self.newsItemArray insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.newsItemArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsItemArray.count;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

   
    cell.object = self.newsItemArray[indexPath.row];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.newsItemArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
