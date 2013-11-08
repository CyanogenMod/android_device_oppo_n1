package com.cyanogenmod.settings.device.utils;


import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.text.TextUtils;

import com.cyanogenmod.n1.configuration.FileUtils;

public class NodePreferenceActivity extends PreferenceActivity implements OnPreferenceChangeListener {

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        String node = Constants.sNodePreferenceMap.get(preference.getKey());
        if (!TextUtils.isEmpty(node)) {
            Boolean value = (Boolean) newValue;
            FileUtils.writeLine(node, value ? "1" : "0");
            return true;
        }
        return false;
    }


    @Override
    public void addPreferencesFromResource(int preferencesResId) {
        super.addPreferencesFromResource(preferencesResId);
        // Initialize node preferences
        for (String pref : Constants.sNodePreferenceMap.keySet()) {
            CheckBoxPreference b = (CheckBoxPreference) findPreference(pref);
            if (b == null) continue;
            b.setOnPreferenceChangeListener(this);
            String node = Constants.sNodePreferenceMap.get(pref);
            String curNodeValue = FileUtils.readOneLine(node);
            b.setChecked(curNodeValue.equals("1"));
        }
    }
}
