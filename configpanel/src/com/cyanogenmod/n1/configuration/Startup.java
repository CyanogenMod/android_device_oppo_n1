package com.cyanogenmod.n1.configuration;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public class Startup extends BroadcastReceiver {
    @Override
    public void onReceive(final Context context, final Intent bootintent) {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);

        // Restore nodes to saved preference values
        for (String pref : Constants.sNodePreferenceMap.keySet()) {
            boolean value = preferences.getBoolean(pref, true);
            String node = Constants.sNodePreferenceMap.get(pref);
            FileUtils.writeLine(node, value ? "1" : "0");
        }
    }
}