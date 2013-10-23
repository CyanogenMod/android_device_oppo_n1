package com.cyanogenmod.n1.configuration;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.text.TextUtils;

import com.cyanogenmod.n1.configuration.R;

public class ConfigurationPanel extends PreferenceActivity implements OnPreferenceChangeListener {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main_panel);

        // Initialize preferences
        for (String pref : Constants.sNodePreferenceMap.keySet()) {
            CheckBoxPreference b = (CheckBoxPreference) findPreference(pref);
            b.setOnPreferenceChangeListener(this);
            String node = Constants.sNodePreferenceMap.get(pref);
            String curNodeValue = FileUtils.readOneLine(node);
            b.setChecked(curNodeValue.equals("1"));
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        String node = Constants.sNodePreferenceMap.get(preference.getKey());
        if (!TextUtils.isEmpty(node)) {
            Boolean value = (Boolean) newValue;
            FileUtils.writeLine(node, value ? "1" : "0");
        }
        return true;
    }
}
