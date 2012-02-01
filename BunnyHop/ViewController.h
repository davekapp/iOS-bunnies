//
//  ViewController.h
//  BunnyHop
//
//  Created by David Kapp on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *hopLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyImage1;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyImage2;
@property (weak, nonatomic) IBOutlet UIImageView *bunnyImage3;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UIStepper *speedStepper;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

- (IBAction)sliderDidChange:(id)sender;
- (IBAction)stepperDidChange:(id)sender;
- (IBAction)toggleAnimation:(id)sender;


@end
