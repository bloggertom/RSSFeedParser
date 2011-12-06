//
//  IndicatorViewController.m
//  Shopshire App
//
//  Created by Thomas Wilson on 07/11/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "IndicatorViewController.h"

@implementation IndicatorViewController
@synthesize indicator;

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
    [indicator startAnimating];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
    [indicator stopAnimating];
}
- (void)viewDidUnload
{
    [self setIndicator:nil];
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
