//
//  DRVCountryPickerViewController.m
//  CareDrive
//
//  Created by Egor Tolstoy on 06.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerViewController.h"

#import <MapKit/MapKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>
#import <PureLayout/PureLayout.h>

static CGFloat DRVCountryTableHeaderViewHeight = 250.0f;

@interface DRVCountryPickerViewController () <RMMapViewDelegate, UITableViewDelegate>

@property (strong, nonatomic) UIView *countryTableHeaderView;
@property (strong, nonatomic) RMMapView *countryMapView;
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;

@property (strong, nonatomic) id <UITableViewDataSource> tableViewDataSource;
@property (strong, nonatomic) RMMBTilesSource *tilesSource;

@end

@implementation DRVCountryPickerViewController

#pragma mark - Жизненный цикл экрана

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableHeaderView];
    
    self.countryMapView.delegate = self;
    self.countryTableView.delegate = self;
    
    [self.countryMapView setTileSource:self.tilesSource];
    self.countryTableView.dataSource = self.tableViewDataSource;
    [self.countryTableView reloadData];
}

#pragma mark - Установка внешнего вида экрана

- (void)setupTableHeaderView {
    self.countryTableHeaderView = self.countryTableView.tableHeaderView;
    self.countryTableView.tableHeaderView = nil;
    self.countryMapView = [[RMMapView alloc] initWithFrame:self.countryTableHeaderView.frame];
    [self.countryTableHeaderView addSubview:self.countryMapView];
    
    self.countryTableView.contentInset = UIEdgeInsetsMake(DRVCountryTableHeaderViewHeight, 0, 0, 0);
    self.countryTableView.contentOffset = CGPointMake(0, -DRVCountryTableHeaderViewHeight);
    
    [self.countryTableView addSubview:self.countryTableHeaderView];
    [self.countryMapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

    [self updateHeaderView];
}

- (void)updateHeaderView {
    CGRect frame = CGRectMake(0, -DRVCountryTableHeaderViewHeight, self.countryTableView.bounds.size.width, DRVCountryTableHeaderViewHeight);
    if (self.countryTableView.contentOffset.y < -DRVCountryTableHeaderViewHeight) {
        frame.origin.y = self.countryTableView.contentOffset.y;
        frame.size.height = -self.countryTableView.contentOffset.y;
    }
    self.countryTableHeaderView.frame = frame;
}

#pragma mark - Методы UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeaderView];
}

#pragma mark - Методы DRVCountryPickerView

- (void)setMapTilesWithName:(NSString *)mapTilesName format:(NSString *)mapTilesFormat {
    RMMBTilesSource *tilesSource = [[RMMBTilesSource alloc] initWithTileSetResource:mapTilesName ofType:mapTilesFormat];
    self.tilesSource = tilesSource;
    [self.countryMapView setTileSource:self.tilesSource];
}

- (void)setCountryTableViewDataSource:(id <UITableViewDataSource>)dataSource {
    self.tableViewDataSource = dataSource;
    self.countryTableView.dataSource = self.tableViewDataSource;
    [self.countryTableView reloadData];
}

#pragma mark - Методы RMMapViewDelegate

- (void)singleTapOnMap:(RMMapView *)map at:(CGPoint)point {
    [self.presenter processTapOnMap:map at:point];
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    return annotation.layer;
}

@end
