
package com.reactlibrary;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

public class RNActionSheetModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNActionSheetModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNActionSheet";
  }

  @ReactMethod
  public void show(ReadableMap options, final Callback callback) {
    Activity currentActivity = getCurrentActivity();

    final ReadableArray readableArray = options.getArray("items");

    AlertDialog.Builder builder = new AlertDialog.Builder(currentActivity);
    builder.setTitle(options.getString("title"));

    String[] items = new String[readableArray.size()];
    for (int i = 0; i < readableArray.size(); i++) {
      ReadableMap readableMap = readableArray.getMap(i);
      items[i] = readableMap.getString("title");
    }

    builder.setItems(items, new DialogInterface.OnClickListener() {
      public void onClick(DialogInterface dialog, int item) {
        WritableMap writableMap = Arguments.createMap();
        writableMap.putString("key", readableArray.getMap(item).getString("key"));
        callback.invoke(writableMap);
      }
    });

    AlertDialog alert = builder.create();
    alert.show();
  }
}