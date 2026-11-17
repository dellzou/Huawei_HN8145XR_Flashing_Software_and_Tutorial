# 华为 HN8145XR 工具包

配套文章：[华为 HN8145XR 使能教程：主猫改公版、刷固件与从猫组网](https://xiaozou123.cn/huawei-hn8145xr-fttr-enable-huawei-interface/)

HN8145XR 是 FTTR 主猫：XG-PON / 10G EPON 上行，4GE + 1POTS + 1USB + 1 个下行光口，Wi-Fi 6，带 K662D 从猫。

## 使用顺序

1. `ONT_V3-V5.exe` → “V5 使能” → 灯全闪后重启。
2. 同一工具 → “升级” → 选 `HN8145XR_shell.bin` → 灯全灭后重启。
3. telnet 进 192.168.1.1（root / adminHW，移动版 Hw8@cMcc），备份 boardinfo。
4. 改码或执行 `restorehwmode.sh`，重启后地址变 192.168.100.1。
5. 刷固件用 `load pack by tftp`，**必须刷两次**，主备分区才一致。

## 文件

| 文件 | 字节 | SHA256（前 32 位） |
|---|---|---|
| `HN8145XR_shell.bin` | 13,569 | `a09b714957eea0da268b5267cbe6aed6…` |
| `HW_Dollar2.exe` | 161,280 | `d3110469d8cccc7ca479105393e047fa…` |
| `Huawei_Config_Crypto.exe` | 1,794,560 | `8f005af234f73a456f5e4a127ed4624c…` |
| `ONT_V3-V5.exe` | 3,503,060 | `a3dfc3daaf05fbff5b0da523dbb50b07…` |
| `echo20_Telnet_Shell.bin` | 19,012 | `13c48faddf373d7f071070ba76ffc915…` |
| `putty.exe` | 574,976 | `a92c1d668f6d060db06535ad346221d2…` |
| `tftpd64.exe` | 343,040 | `2f5de838cf3079723f1697e5fac2f75f…` |
| `一键HN8145XR降级R260.bat` | 514 | `ccd3b263d1db9802af897d427d98c788…` |
| `一键导出boardinfo和上传地区包XR专用.bat` | 943 | `5cc36156eeef1bdfa5314ad810775260…` |

`HN8145XR_shell.bin` 与 `echo20_Telnet_Shell.bin` 功能不同，前者只管补 shell，后者是一体补丁（含 Telnet 端口放行）。固件代际不确定时先试 echo20。

## Release

- `HN8145XR_V500R021C00SPC260B130.bin`：74 MB 整包固件，三网通用，刷完不改界面代码。
- `HN8145XR_region_packages.zip`：电信 R021 插件包（e8c 1–4）与电信/移动/联通三套地区包。

## 两个 bat 的坑

`一键导出boardinfo和上传地区包XR专用.bat` 和 `一键HN8145XR降级R260.bat` 里写死了电脑地址 `192.168.1.8`，用之前必须改成自己的网段。脚本靠 VBS 模拟键盘输入，执行过程中不要动鼠标键盘。

## 注意

工具无签名，杀软会拦；刷固件中途断电可能起不来。只在自己或客户授权的设备上使用。

