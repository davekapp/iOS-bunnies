//
//  ViewController.m
//  BunnyHop
//
//  Created by David Kapp on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

float randomAnimationOffset() {
  return (float)(rand() % 11 + 1) / 10.0;
}

@interface ViewController ()

@property (strong, nonatomic) NSArray *allBunnies; 

- (void) setupAnimations;

@end

@implementation ViewController
@synthesize hopLabel;
@synthesize bunnyImage1;
@synthesize bunnyImage2;
@synthesize bunnyImage3;
@synthesize speedSlider;
@synthesize speedStepper;
@synthesize toggleButton;
@synthesize allBunnies;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.allBunnies = [[NSArray alloc] initWithObjects:
                     self.bunnyImage1,
                     self.bunnyImage2,
                     self.bunnyImage3,
                     nil];
    
  [self setupAnimations];
}

- (void)viewDidUnload
{
  [self setHopLabel:nil];
  [self setBunnyImage1:nil];
  [self setBunnyImage2:nil];
  [self setBunnyImage3:nil];
  [self setSpeedSlider:nil];
  [self setSpeedStepper:nil];
  [self setToggleButton:nil];
  [self setAllBunnies:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)sliderDidChange:(id)sender {
  self.speedStepper.value = self.speedSlider.value;
  float newBaseDuration = 4 - self.speedSlider.value;
  for (UIImageView *bunny in self.allBunnies) {
    bunny.animationDuration = newBaseDuration + randomAnimationOffset();
  }
  self.hopLabel.text = [[NSString alloc] initWithFormat:@"%1.2f hps", 1.0/newBaseDuration];
  [self toggleAnimation:self];
}

- (IBAction)stepperDidChange:(id)sender {
  self.speedSlider.value = self.speedStepper.value;
  [self sliderDidChange:self];
}

- (IBAction)toggleAnimation:(id)sender {
  if (self.bunnyImage1.isAnimating) {
    for(UIImageView* bunny in self.allBunnies) {
      [bunny stopAnimating];
    }
    [self.toggleButton setTitle:@"Hop!" forState:UIControlStateNormal];
  } else {
    for(UIImageView* bunny in self.allBunnies) {
      [bunny startAnimating];
    }
    [self.toggleButton setTitle:@"Stop!" forState:UIControlStateNormal];
  }
}

- (void) setupAnimations {
  NSArray *animation = [[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"funny-pictures-evry-bunny-was-kung-fu-fighting.jpg"],
                        [UIImage imageNamed:@"funny-pictures-cat-loves-bunnies.jpg"],
                        nil];
  
  for (UIImageView *bunny in self.allBunnies) {
    bunny.animationImages = animation;
    bunny.animationDuration = 1;
  }
}
@end
