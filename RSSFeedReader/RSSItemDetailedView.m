//
//  RSSItemDetailedView.m
//  RSSFeedReader
//
//  Created by Thomas Wilson on 06/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "RSSItemDetailedView.h"

@implementation RSSItemDetailedView
@synthesize detailLabel;
@synthesize titleLabel;
@synthesize urlLabel;
@synthesize item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = item.title;
    self.detailLabel.text = item.itemDiscription;
    self.urlLabel.text = [item.link absoluteString];
}

- (void)viewDidUnload
{
    [self setDetailLabel:nil];
    [self setTitleLabel:nil];
    [self setUrlLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
