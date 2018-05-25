/adb devices
rm -rf VehicleProfile.db
./adb -s FA78T1800124 exec-out "run-as com.app.packagename cat databases/VehicleProfile.db" > VehicleProfile.db
sqlite3 VehicleProfile.db
