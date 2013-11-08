package com.cyanogenmod.settings.device;

import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothDevicePicker;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.widget.Toast;

import com.cyanogenmod.settings.device.utils.Constants;

@SuppressWarnings("deprecation")
public class BluetoothInputSettings extends PreferenceActivity implements OnPreferenceChangeListener {

    static final String PROCESS_COMMAND_ACTION = "process_command";
    static final String COMMAND_KEY = "command";

    private static final int BLUETOOTH_REQUEST_CODE = 1;
    private static final int BLUETOOTH_PICKER_CODE = 2;
    private static final String sOclickCategoryKey = "oclick_pref_category";

    private ProgressDialog mProgressDialog;
    EventReceiver mReceiver;
    boolean mConnected;

    class EventReceiver extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            int commandKey = intent.getIntExtra(COMMAND_KEY, -1);
            switch (commandKey) {
            case BluetoothGatt.STATE_CONNECTED:
                if (mProgressDialog != null) {
                    setConnectedState(true);
                    mProgressDialog.dismiss();
                    Toast.makeText(context, "O-click connected", Toast.LENGTH_SHORT).show();
                }
                break;
            case BluetoothGatt.STATE_DISCONNECTED:
                setConnectedState(false);
            }
        }
    }

    void setConnectedState(boolean enable) {
        mConnected = enable;
        findPreference(sOclickCategoryKey).setEnabled(enable);
        findPreference("oclick_connect").setTitle("Tap to " + (enable ? "disconnect" : "connect"));
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.oclick_panel);
        mReceiver = new EventReceiver();
    }

    private void ensureBluetooth() {
        BluetoothManager bluetoothManager = (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
        BluetoothAdapter bluetoothAdapter = bluetoothManager.getAdapter();

        // Ensures Bluetooth is available on the device and it is enabled. If not,
        // displays a dialog requesting user permission to enable Bluetooth.
        if (bluetoothAdapter == null || !bluetoothAdapter.isEnabled()) {
            Intent enableBtIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBtIntent, BLUETOOTH_REQUEST_CODE);
            return;
        }

        BluetoothDevice paired = OclickService.getPairedOclick(bluetoothAdapter);
        if (paired != null) {
            mProgressDialog = ProgressDialog.show(this, "O-click", "Searching for device", true);
            Intent i = new Intent(this, OclickService.class);
            i.putExtra(BluetoothDevice.EXTRA_DEVICE, paired);
            startService(i);
            return;
        } else {
            Intent i = new Intent(BluetoothDevicePicker.ACTION_LAUNCH);
            i.putExtra(BluetoothDevicePicker.EXTRA_LAUNCH_PACKAGE, getPackageName());
            i.putExtra(BluetoothDevicePicker.EXTRA_LAUNCH_CLASS, BluetoothReceiver.class.getName());
            startActivityForResult(i, BLUETOOTH_PICKER_CODE);
        }
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen,
            Preference preference) {
        if (preference.getKey().equals(Constants.OCLICK_CONNECT_KEY)) {
            if (mConnected) {
                Intent i = new Intent(this, OclickService.class);
                stopService(i);
                setConnectedState(false);
            } else {
                ensureBluetooth();
            }
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        return true;
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == BLUETOOTH_REQUEST_CODE) {
            ensureBluetooth();
        } else if (requestCode == BLUETOOTH_PICKER_CODE){
            mProgressDialog = ProgressDialog.show(this, "O-click", "Attempting to pair", true);
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (mProgressDialog != null) {
                        mProgressDialog.dismiss();
                    }
                }
            }, 10000);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        IntentFilter filter = new IntentFilter();
        filter.addAction(PROCESS_COMMAND_ACTION);
        registerReceiver(mReceiver, filter);
    }

    @Override
    protected void onPause() {
        super.onPause();
        unregisterReceiver(mReceiver);
    }
}
