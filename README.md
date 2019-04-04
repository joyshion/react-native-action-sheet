# @joyshion/react-native-action-sheet

## Screenshot

 ![android](https://github.com/joyshion/react-native-action-sheet/blob/master/screenshot/android.png)   ![ios](https://github.com/joyshion/react-native-action-sheet/blob/master/screenshot/ios.png)

## Getting started

`$ npm install @joyshion/react-native-action-sheet --save`

### Mostly automatic installation

`$ react-native link @joyshion/react-native-action-sheet`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `@joyshion/react-native-action-sheet` and add `RNActionSheet.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNActionSheet.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNActionSheetPackage;` to the imports at the top of the file
  - Add `new RNActionSheetPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':@joyshion_react-native-action-sheet'
  	project(':@joyshion_react-native-action-sheet').projectDir = new File(rootProject.projectDir, 	'../node_modules/@joyshion/react-native-action-sheet/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':@joyshion_react-native-action-sheet')
  	```

## Usage
```javascript
import ActionSheet from '@joyshion/react-native-action-sheet';

ActionSheet.show({
	title: 'Who are you?',
	items: [{
		key: 'a',
		title: 'Mick'
	}, { 
		key: 'b',
		title: 'John'
	}]
});
```
