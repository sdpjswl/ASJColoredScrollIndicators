// ASJScrollView.m
//
// Copyright (c) 2016 Sudeep Jaiswal
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ASJScrollView.h"

@interface ASJScrollView ()

@property (copy, nonatomic) NSSet *scrollIndicators;

- (void)asj_setup;
- (void)asj_applyScrollIndicatorColor;

@end

@implementation ASJScrollView

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self asj_setup];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    [self asj_setup];
  }
  return self;
}

#pragma mark - Setup

- (void)asj_setup
{
  [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  if ([keyPath isEqualToString:@"contentOffset"])
  {
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    NSSet *subviewsWithoutIndicator = [NSSet setWithArray:self.subviews];
    
    self.showsHorizontalScrollIndicator = YES;
    self.showsVerticalScrollIndicator = YES;
    NSMutableSet *subviewsWithIndicator = [NSMutableSet setWithArray:self.subviews];
    
    [subviewsWithIndicator minusSet:subviewsWithoutIndicator];
    _scrollIndicators = [NSSet setWithSet:subviewsWithIndicator];
    
    [self asj_applyScrollIndicatorColor];
    [self removeObserver:self forKeyPath:@"contentOffset"];
  }
}

#pragma mark - Color indicators

- (void)asj_applyScrollIndicatorColor
{
  if (!_scrollIndicatorColor) {
    return;
  }
  
  for (UIImageView *imgV in _scrollIndicators)
  {
    imgV.image = [imgV.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imgV.tintColor = [UIColor clearColor];
    imgV.layer.cornerRadius = 1.5;
    imgV.backgroundColor = _scrollIndicatorColor;
  }
}

@end
