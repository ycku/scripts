# VMware ESXi 6.5
## Issues of Installation 

1.  USB開機偵測不到, 無法安裝  
* 在ESXi USB開機時, 按shift + O  
* 增加開機參數 -> prefervmklinux=true  
2.  網路卡偵測不到  
* 加入網路卡driver, 並製作新的開機安裝iso  
* https://www.v-front.de/2014/12/how-to-make-your-unsupported-nic-work.html  

## Ubuntu VMware Tools
* 建議使用vmware tools, 方便控制台可以看到更多資訊  
* 可以直接使用apt安裝:
```
$ sudo apt install open-vm-tools
```
