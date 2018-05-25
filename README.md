# List Devices
```
/adb devices
```

# Export Database

## If the application is debuggable you can use the run-as command in adb shell
```
./adb -s FA78T1800124 exec-out "run-as com.app.packagename cat databases/VehicleProfile.db" > VehicleProfile.db
```
## If the application is not debuggable, you can use Android's backup function

- export data as backup data
```
adb backup -noapk com.app.packagename
```
- upcompress backup data to tar and uncompress it
```
dd if=backup.ab bs=1 skip=24 | python -c "import zlib,sys;sys.stdout.write(zlib.decompress(sys.stdin.read()))" > backup.tar
tar xvf backup.tar 
```

# Reference
[Unpacking Android backups](https://nelenkov.blogspot.tw/2012/06/unpacking-android-backups.html)