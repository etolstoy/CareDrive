//
//  DRVCountryPickerViewController.m
//  CareDrive
//
//  Created by Egor Tolstoy on 06.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerViewController.h"

#import <MapKit/MapKit.h>

@interface DRVCountryPickerViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *countryMapView;
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;

@end

@implementation DRVCountryPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
