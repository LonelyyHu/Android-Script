# Common Commands
列出目前已經連接的裝置  
``` adb devices ```  
顯示目前連接裝置更詳細的資訊  
``` adb devices -l ```  
 
如果系統回應 List of devices attached, no permissions等訊息
解決方法 : (權限不足時，在前方加上sudo)
```
adb kill-server
adb start-server
``` 
 
在連接裝置只有一台的情況下，這個指令會自動進入該裝置的shell  
``` adb shell ```
 
如果在多台裝置的情況下，你必須加上-s選擇你要連接的裝置
(選擇usb port的功能只有mac, ubuntu等OS提供)  
``` adb -s "裝置所連接的usb port, id, 或ip位置" shell ```
 
傳送檔案進入裝置(local -> device)  
``` adb push "本地檔案路徑" "目標檔案路徑" ```
 
拉檔案到本地端(device -> local)  
``` adb pull "目標檔案路徑" "本地檔案路徑" ```
 
查看目前裝置log (持續更新)  
``` adb logcat ```
 
查看裝置到目前為止的log (不更新)  
``` adb logcat -d ```
 
查看log中某個tag  
``` adb logcat -s "tagName" ```
 
輸出log為txt檔  
``` adb logcat -> log.txt ```

# Export Database

## If the application is debuggable you can use the run-as command in adb shell
```
./adb -s $deviceId exec-out "run-as com.app.packagename cat databases/VehicleProfile.db" > VehicleProfile.db
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