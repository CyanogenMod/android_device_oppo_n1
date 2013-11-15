package com.cyanogenmod.settings.device;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothDevicePicker;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class BluetoothReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(final Context context, final Intent intent) {
        String action = intent.getAction();
        if (action.equals(BluetoothDevice.ACTION_ACL_CONNECTED)
                || action.equals(BluetoothDevicePicker.ACTION_DEVICE_SELECTED)) {
            if (!intent.hasExtra(BluetoothDevice.EXTRA_DEVICE)) {
                return;
            }
            BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
            if (device != null && device.getName().toLowerCase().contains("oppo b")) {
                Intent i = new Intent(context, OclickService.class);
                i.putExtra(BluetoothDevice.EXTRA_DEVICE, device);
                context.startService(i);
            }
        }
    }
}
