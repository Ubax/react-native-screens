'use client';

import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  DirectEventHandler,
  Float,
} from 'react-native/Libraries/Types/CodegenTypes';

export type TabAccessoryEnvironmentChange = {
  accessoryEnvironment: string;
};

export type SizeChange = {
  width: Float;
  height: Float;
};

export interface NativeProps extends ViewProps {
  // Events
  onTabAccessoryEnvironmentChange?: DirectEventHandler<TabAccessoryEnvironmentChange>;
  onSizeChange?: DirectEventHandler<SizeChange>;
}

export default codegenNativeComponent<NativeProps>(
  'RNSBottomTabsAccessory',
  {},
);
