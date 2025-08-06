#import "RNSBottomTabsAccessoryComponentView.h"
#import "RNSConversions.h"
#import "RNSDefines.h"
#import "RNSTabBarController.h"

#import <React/RCTConversions.h>
#import <react/renderer/components/rnscreens/ComponentDescriptors.h>
#import <react/renderer/components/rnscreens/EventEmitters.h>
#import <react/renderer/components/rnscreens/Props.h>
#import <react/renderer/components/rnscreens/RCTComponentViewHelpers.h>

namespace react = facebook::react;

#pragma mark - View implementation

@implementation RNSBottomTabsAccessoryComponentView {
  RNSBottomTabsAccessoryEventEmitter *_Nonnull _reactEventEmitter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    [self initState];
    //          NSArray<NSLayoutConstraint *> *constraints = @[
    //              [self.trackLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0],
    //              [self.trackLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0],
    //              [self.trackLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:0],
    //              [self.trackLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0],
    //              [self.heightAnchor constraintEqualToConstant:50]
    //          ];
    //          [NSLayoutConstraint activateConstraints:constraints];
  }
  return self;
}

- (void)initState
{
  static const auto defaultProps = std::make_shared<const react::RNSBottomTabsAccessoryProps>();
  _props = defaultProps;

  _reactEventEmitter = [RNSBottomTabsAccessoryEventEmitter new];

  [self resetProps];
}

- (void)resetProps
{
}

#pragma mark - Events

- (nonnull RNSBottomTabsAccessoryEventEmitter *)reactEventEmitter
{
  RCTAssert(_reactEventEmitter != nil, @"[RNScreens] Attempt to access uninitialized _reactEventEmitter");
  return _reactEventEmitter;
}

#pragma mark - RCTViewComponentViewProtocol
#if RCT_NEW_ARCH_ENABLED
- (void)updateEventEmitter:(const facebook::react::EventEmitter::Shared &)eventEmitter
{
  [super updateEventEmitter:eventEmitter];
  [_reactEventEmitter
      updateEventEmitter:std::static_pointer_cast<const react::RNSBottomTabsAccessoryEventEmitter>(eventEmitter)];
}

+ (react::ComponentDescriptorProvider)componentDescriptorProvider
{
  return react::concreteComponentDescriptorProvider<react::RNSBottomTabsAccessoryComponentDescriptor>();
}

+ (BOOL)shouldBeRecycled
{
  // There won't be tens of instances of this component usually & it's easier for now.
  // We could consider enabling it someday though.
  return NO;
}
#endif // RCT_NEW_ARCH_ENABLED

#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && defined(__IPHONE_26_0) && \
    __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_26_0
- (void)updateProperties
{
  [super updateProperties];
  if (@available(iOS 26.0, *)) {
    BOOL isInline = self.traitCollection.tabAccessoryEnvironment == UITabAccessoryEnvironmentInline;
    [self.reactEventEmitter
        emitOnTabAccessoryEnvironmentChange:OnTabAccessoryEnvironmentChangePayload{
                                                .accessoryEnvironment = isInline ? @"inline" : @"regular"}];
  }
}
#endif

- (void)layoutSubviews
{
  [self.reactEventEmitter emitOnSizeChange:OnTabAccessorySizeChangePayload {
    .width = @(self.bounds.size.width), .height = @(self.bounds.size.height)
  }];
  [super layoutSubviews];
}

@end

#pragma mark - View class exposure

Class<RCTComponentViewProtocol> RNSBottomTabsAccessory(void)
{
  return RNSBottomTabsAccessoryComponentView.class;
}