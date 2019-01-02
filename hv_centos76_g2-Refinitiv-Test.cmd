set PACKER_LOG=0
..\bin\packer.exe validate .\templates\hv_centos76_g2-Refinitiv.json
..\bin\packer.exe build .\templates\hv_centos76_g2-Refinitiv.json
