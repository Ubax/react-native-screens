#import <Foundation/Foundation.h>

// Hide C++ symbols from C compiler used when building Swift module
#if defined(__cplusplus)
#import <react/renderer/components/rnscreens/EventEmitters.h>

namespace react = facebook::react;
#endif // __cplusplus

NS_ASSUME_NONNULL_BEGIN

#if defined(__cplusplus)
struct OnTabAccessoryEnvironmentChangePayload {
  NSString *_Nonnull accessoryEnvironment;
};
struct OnTabAccessorySizeChangePayload {
  NSNumber *_Nonnull width;
  NSNumber *_Nonnull height;
};
#else
typedef struct {
  NSString *_Nonnull accessoryEnvironment;
} OnTabAccessoryEnvironmentChangePayload;
typedef struct {
  NSNumber *_Nonnull width;
  NSNumber *_Nonnull height;
} OnTabAccessorySizeChangePayload;
#endif

@interface RNSBottomTabsAccessoryEventEmitter : NSObject

- (BOOL)emitOnTabAccessoryEnvironmentChange:(OnTabAccessoryEnvironmentChangePayload)payload;
- (BOOL)emitOnSizeChange:(OnTabAccessorySizeChangePayload)payload;

@end

#pragma mark - Hidden from Swift

#if defined(__cplusplus)

@interface RNSBottomTabsAccessoryEventEmitter ()

- (void)updateEventEmitter:(const std::shared_ptr<const react::RNSBottomTabsAccessoryEventEmitter> &)emitter;

@end

#endif // __cplusplus

NS_ASSUME_NONNULL_END