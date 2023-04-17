// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package com.epiccodez.shaadi_book;

import android.content.Intent;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "mycall";
    //Class attribute
    private MethodChannel.Result myresult;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        //     .setMethodCallHandler(
        //     (call, result) -> {
        //         // This method is invoked on the main thread.
        //         // TODO
        //     }
        //     );
        //Method chanel
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    // Note: this method is invoked on the main thread.
                    if (call.method.equals("mycall")) {
                        myresult = result; //Store the flutter result
                        String text = call.argument("text");
                        System.out.println(text);
                        Intent intent1 = new Intent(getApplicationContext(),FlipActivity.class);//Start your special native stuff
                        startActivityForResult(intent1, 101);
                    } else {
                        result.notImplemented();
                    }
                });
    }



    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        // Check which request we're responding to
        if (requestCode == 101) {
            myresult.success("this will be your result"); //Probably do something with the data instead of a static string.
        }
    }
}
