#!/bin/sh
# Author: Andreas Weber
# Date: 26.12.2006
# Purpose: Script to detect Nvidia Cards and assign a Driver

# Get Card info 
ID1=$(lspci -nn | grep "VGA\ compatible\ controller" | cut -d ' ' -f 1)
ID2=$(lspci -n | grep $ID1 | cut -d ' ' -f 3)
ID3=$(echo $ID2 | cut -d ':' -f 2 | tr '[a-z]' '[A-Z]')

case $ID3 in
# Detecting Cards which requires the legacy Driver
0020) NAME="RIVA TNT"; DRIVER="legacy";;
0028) NAME="RIVA TNT2/TNT2 Pro"; DRIVER="legacy";;
0029) NAME="RIVA TNT2 Ultra"; DRIVER="legacy";;
00A0) NAME="Aladdin TNT2"; DRIVER="legacy";;
002D) NAME="RIVA TNT2 Model 64/Model 64 Pro"; DRIVER="legacy";;
0100) NAME="GeForce 256"; DRIVER="legacy";;
0101) NAME="GeForce DDR"; DRIVER="legacy";;
0110) NAME="GeForce2 MX/MX 400"; DRIVER="legacy";;
0111) NAME="GeForce2 MX 100/200"; DRIVER="legacy";;
0112) NAME="GeForce2 Go"; DRIVER="legacy";;
0151) NAME="GeForce2 Ti"; DRIVER="legacy";;
0152) NAME="GeForce2 Ultra"; DRIVER="legacy";;
002C) NAME="Vanta/Vanta LT"; DRIVER="legacy";;
0103) NAME="Quadro"; DRIVER="legacy";;
0113) NAME="Quadro2 MXR/EX/Go"; DRIVER="legacy";;
0150) NAME="GeForce2 GTS/GeForce2 Pro"; DRIVER="legacy";;
0153) NAME="Quadro2 Pro"; DRIVER="legacy";;

# Detecting Cards which are supported by the binary NVIDIA Driver
0112) NAME="GeForce2 Go"; DRIVER="nvidia";;
01A0) NAME="GeForce2 Integrated GPU"; DRIVER="nvidia";;
0111) NAME="GeForce2 MX 100/200"; DRIVER="nvidia";;
0110) NAME="GeForce2 MX/MX 400"; DRIVER="nvidia";;
0200) NAME="GeForce3"; DRIVER="nvidia";;
0201) NAME="GeForce3 Ti 200"; DRIVER="nvidia";;
0202) NAME="GeForce3 Ti 500"; DRIVER="nvidia";;
017D) NAME="GeForce4 410 Go 16M"; DRIVER="nvidia";;
0286) NAME="GeForce4 4200 Go"; DRIVER="nvidia";;
0175) NAME="GeForce4 420 Go"; DRIVER="nvidia";;
0176) NAME="GeForce4 420 Go 32M"; DRIVER="nvidia";;
0174) NAME="GeForce4 440 Go"; DRIVER="nvidia";;
0179) NAME="GeForce4 440 Go 64M"; DRIVER="nvidia";;
0177) NAME="GeForce4 460 Go"; DRIVER="nvidia";;
0185) NAME="GeForce4 MX 4000"; DRIVER="nvidia";;
0172) NAME="GeForce4 MX 420"; DRIVER="nvidia";;
0183) NAME="GeForce4 MX 420 with AGP8X"; DRIVER="nvidia";;
0171) NAME="GeForce4 MX 440"; DRIVER="nvidia";;
0173) NAME="GeForce4 MX 440-SE"; DRIVER="nvidia";;
0182) NAME="GeForce4 MX 440SE with AGP8X"; DRIVER="nvidia";;
0181) NAME="GeForce4 MX 440 with AGP8X"; DRIVER="nvidia";;
0170) NAME="GeForce4 MX 460"; DRIVER="nvidia";;
01F0) NAME="GeForce4 MX Integrated GPU"; DRIVER="nvidia";;
0253) NAME="GeForce4 Ti 4200"; DRIVER="nvidia";;
0281) NAME="GeForce4 Ti 4200 with AGP8X"; DRIVER="nvidia";;
0251) NAME="GeForce4 Ti 4400"; DRIVER="nvidia";;
0250) NAME="GeForce4 Ti 4600"; DRIVER="nvidia";;
0280) NAME="GeForce4 Ti 4800"; DRIVER="nvidia";;
0282) NAME="GeForce4 Ti 4800 SE"; DRIVER="nvidia";;
0242) NAME="GeForce 6100"; DRIVER="nvidia";;
0240) NAME="GeForce 6150"; DRIVER="nvidia";;
0241) NAME="GeForce 6150 LE"; DRIVER="nvidia";;
00F3) NAME="GeForce 6200"; DRIVER="nvidia";;
014F) NAME="GeForce 6200"; DRIVER="nvidia";;
0163) NAME="GeForce 6200 LE"; DRIVER="nvidia";;
0161) NAME="GeForce 6200 TurboCache™"; DRIVER="nvidia";;
0160) NAME="GeForce 6500"; DRIVER="nvidia";;
00F2) NAME="GeForce 6600"; DRIVER="nvidia";;
0141) NAME="GeForce 6600"; DRIVER="nvidia";;
00F1) NAME="GeForce 6600/GeForce 6600 GT"; DRIVER="nvidia";;
0140) NAME="GeForce 6600 GT"; DRIVER="nvidia";;
00F4) NAME="GeForce 6600 LE"; DRIVER="nvidia";;
0142) NAME="GeForce 6600 LE"; DRIVER="nvidia";;
0143) NAME="GeForce 6600 VE"; DRIVER="nvidia";;
0145) NAME="GeForce 6610 XL"; DRIVER="nvidia";;
0147) NAME="GeForce 6700 XL"; DRIVER="nvidia";;
0041) NAME="GeForce 6800"; DRIVER="nvidia";;
00C1) NAME="GeForce 6800"; DRIVER="nvidia";;
0211) NAME="GeForce 6800"; DRIVER="nvidia";;
00F0) NAME="GeForce 6800/GeForce 6800 Ultra"; DRIVER="nvidia";;
0047) NAME="GeForce 6800 GS"; DRIVER="nvidia";;
00C0) NAME="GeForce 6800 GS"; DRIVER="nvidia";;
00F6) NAME="GeForce 6800 GS"; DRIVER="nvidia";;
0045) NAME="GeForce 6800 GT"; DRIVER="nvidia";;
0046) NAME="GeForce 6800 GT"; DRIVER="nvidia";;
0215) NAME="GeForce 6800 GT"; DRIVER="nvidia";;
00C2) NAME="GeForce 6800 LE"; DRIVER="nvidia";;
0212) NAME="GeForce 6800 LE"; DRIVER="nvidia";;
0040) NAME="GeForce 6800 Ultra"; DRIVER="nvidia";;
00F9) NAME="GeForce 6800 Ultra"; DRIVER="nvidia";;
0043) NAME="GeForce 6800 XE"; DRIVER="nvidia";;
0044) NAME="GeForce 6800 XT"; DRIVER="nvidia";;
0048) NAME="GeForce 6800 XT"; DRIVER="nvidia";;
00C3) NAME="GeForce 6800 XT"; DRIVER="nvidia";;
0218) NAME="GeForce 6800 XT"; DRIVER="nvidia";;
01DF) NAME="GeForce 7300 GS"; DRIVER="nvidia";;
0393) NAME="GeForce 7300 GT"; DRIVER="nvidia";;
01D1) NAME="GeForce 7300 LE"; DRIVER="nvidia";;
01D3) NAME="GeForce 7300 SE"; DRIVER="nvidia";;
02E1) NAME="GeForce 7600 GS"; DRIVER="nvidia";;
0392) NAME="GeForce 7600 GS"; DRIVER="nvidia";;
0391) NAME="GeForce 7600 GT"; DRIVER="nvidia";;
0093) NAME="GeForce 7800 GS"; DRIVER="nvidia";;
00F5) NAME="GeForce 7800 GS"; DRIVER="nvidia";;
0092) NAME="GeForce 7800 GT"; DRIVER="nvidia";;
0090) NAME="GeForce 7800 GTX"; DRIVER="nvidia";;
0091) NAME="GeForce 7800 GTX"; DRIVER="nvidia";;
0090) NAME="GeForce 7800 GTX 512"; DRIVER="nvidia";;
0292) NAME="GeForce 7900 GS"; DRIVER="nvidia";;
0291) NAME="GeForce 7900 GT"; DRIVER="nvidia";;
0290) NAME="GeForce 7900 GTX"; DRIVER="nvidia";;
0294) NAME="GeForce 7950 GX2"; DRIVER="nvidia";;
0327) NAME="GeForce FX 5100"; DRIVER="nvidia";;
0320) NAME="GeForce FX 5200"; DRIVER="nvidia";;
0322) NAME="GeForce FX 5200"; DRIVER="nvidia";;
0323) NAME="GeForce FX 5200LE"; DRIVER="nvidia";;
0321) NAME="GeForce FX 5200 Ultra"; DRIVER="nvidia";;
0326) NAME="GeForce FX 5500"; DRIVER="nvidia";;
0312) NAME="GeForce FX 5600"; DRIVER="nvidia";;
0311) NAME="GeForce FX 5600 Ultra"; DRIVER="nvidia";;
0314) NAME="GeForce FX 5600XT"; DRIVER="nvidia";;
0342) NAME="GeForce FX 5700"; DRIVER="nvidia";;
0343) NAME="GeForce FX 5700LE"; DRIVER="nvidia";;
0341) NAME="GeForce FX 5700 Ultra"; DRIVER="nvidia";;
0344) NAME="GeForce FX 5700VE"; DRIVER="nvidia";;
0302) NAME="GeForce FX 5800"; DRIVER="nvidia";;
0301) NAME="GeForce FX 5800 Ultra"; DRIVER="nvidia";;
0331) NAME="GeForce FX 5900"; DRIVER="nvidia";;
0330) NAME="GeForce FX 5900 Ultra"; DRIVER="nvidia";;
0332) NAME="GeForce FX 5900XT"; DRIVER="nvidia";;
0334) NAME="GeForce FX 5900ZT"; DRIVER="nvidia";;
0333) NAME="GeForce FX 5950 Ultra"; DRIVER="nvidia";;
032D) NAME="GeForce FX Go5100"; DRIVER="nvidia";;
0324) NAME="GeForce FX Go5200"; DRIVER="nvidia";;
0328) NAME="GeForce FX Go5200 32M/64M"; DRIVER="nvidia";;
0325) NAME="GeForce FX Go5250"; DRIVER="nvidia";;
032C) NAME="GeForce FX Go53xx"; DRIVER="nvidia";;
031A) NAME="GeForce FX Go5600"; DRIVER="nvidia";;
031B) NAME="GeForce FX Go5650"; DRIVER="nvidia";;
0347) NAME="GeForce FX Go5700"; DRIVER="nvidia";;
0348) NAME="GeForce FX Go5700"; DRIVER="nvidia";;
0164) NAME="GeForce Go 6200"; DRIVER="nvidia";;
0167) NAME="GeForce Go 6200"; DRIVER="nvidia";;
0166) NAME="GeForce Go 6400"; DRIVER="nvidia";;
0168) NAME="GeForce Go 6400"; DRIVER="nvidia";;
0144) NAME="GeForce Go 6600"; DRIVER="nvidia";;
0148) NAME="GeForce Go 6600"; DRIVER="nvidia";;
0149) NAME="GeForce Go 6600 GT"; DRIVER="nvidia";;
0146) NAME="GeForce Go 6600 TE/6200 TE"; DRIVER="nvidia";;
00C8) NAME="GeForce Go 6800"; DRIVER="nvidia";;
00C9) NAME="GeForce Go 6800 Ultra"; DRIVER="nvidia";;
01D7) NAME="GeForce Go 7300"; DRIVER="nvidia";;
01D8) NAME="GeForce Go 7400"; DRIVER="nvidia";;
0398) NAME="GeForce Go 7600"; DRIVER="nvidia";;
0098) NAME="GeForce Go 7800"; DRIVER="nvidia";;
0099) NAME="GeForce Go 7800 GTX"; DRIVER="nvidia";;
0298) NAME="GeForce Go 7900 GS"; DRIVER="nvidia";;
0299) NAME="GeForce Go 7900 GTX"; DRIVER="nvidia";;
00FF) NAME="GeForce PCX 4300"; DRIVER="nvidia";;
00FA) NAME="GeForce PCX 5750"; DRIVER="nvidia";;
00FB) NAME="GeForce PCX 5900"; DRIVER="nvidia";;
0113) NAME="Quadro2 MXR/EX/Go"; DRIVER="nvidia";;
018B) NAME="Quadro4 380 XGL"; DRIVER="nvidia";;
017C) NAME="Quadro4 500 GoGL"; DRIVER="nvidia";;
0178) NAME="Quadro4 550 XGL"; DRIVER="nvidia";;
0188) NAME="Quadro4 580 XGL"; DRIVER="nvidia";;
028C) NAME="Quadro4 700 GoGL"; DRIVER="nvidia";;
025B) NAME="Quadro4 700 XGL"; DRIVER="nvidia";;
0259) NAME="Quadro4 750 XGL"; DRIVER="nvidia";;
0289) NAME="Quadro4 780 XGL"; DRIVER="nvidia";;
0258) NAME="Quadro4 900 XGL"; DRIVER="nvidia";;
0288) NAME="Quadro4 980 XGL"; DRIVER="nvidia";;
0203) NAME="Quadro DCC"; DRIVER="nvidia";;
0309) NAME="Quadro FX 1000"; DRIVER="nvidia";;
034E) NAME="Quadro FX 1100"; DRIVER="nvidia";;
00FE) NAME="Quadro FX 1300"; DRIVER="nvidia";;
00CE) NAME="Quadro FX 1400"; DRIVER="nvidia";;
029E) NAME="Quadro FX 1500"; DRIVER="nvidia";;
029B) NAME="Quadro FX 1500M"; DRIVER="nvidia";;
0308) NAME="Quadro FX 2000"; DRIVER="nvidia";;
029A) NAME="Quadro FX 2500M"; DRIVER="nvidia";;
0338) NAME="Quadro FX 3000"; DRIVER="nvidia";;
00FC) NAME="Quadro FX 330/GeForce PCX 5300"; DRIVER="nvidia";;
00F8) NAME="Quadro FX 3400"; DRIVER="nvidia";;
00CD) NAME="Quadro FX 3450/4000 SDI"; DRIVER="nvidia";;
01DC) NAME="Quadro FX 350M"; DRIVER="nvidia";;
029D) NAME="Quadro FX 3500"; DRIVER="nvidia";;
004E) NAME="Quadro FX 4000"; DRIVER="nvidia";;
00F8) NAME="Quadro FX 4400"; DRIVER="nvidia";;
009D) NAME="Quadro FX 4500"; DRIVER="nvidia";;
029F) NAME="Quadro FX 4500"; DRIVER="nvidia";;
029F) NAME="Quadro FX 4500 X2"; DRIVER="nvidia";;
029C) NAME="Quadro FX 5500"; DRIVER="nvidia";;
01DE) NAME="Quadro FX 350"; DRIVER="nvidia";;
032B) NAME="Quadro FX 500/600 PCI"; DRIVER="nvidia";;
014E) NAME="Quadro FX 540"; DRIVER="nvidia";;
014C) NAME="Quadro FX 550"; DRIVER="nvidia";;
039E) NAME="Quadro FX 560"; DRIVER="nvidia";;
033F) NAME="Quadro FX 700"; DRIVER="nvidia";;
034C) NAME="Quadro FX Go1000"; DRIVER="nvidia";;
00CC) NAME="Quadro FX Go1400"; DRIVER="nvidia";;
031C) NAME="Quadro FX Go700"; DRIVER="nvidia";;
017A) NAME="Quadro NVS"; DRIVER="nvidia";;
01D7) NAME="Quadro NVS 110M"; DRIVER="nvidia";;
01DA) NAME="Quadro NVS 110M"; DRIVER="nvidia";;
01DB) NAME="Quadro NVS 120M"; DRIVER="nvidia";;
032A) NAME="Quadro NVS 280 PCI"; DRIVER="nvidia";;
00FD) NAME="Quadro NVS 280 PCI-E/Quadro FX 330"; DRIVER="nvidia";;
0165) NAME="Quadro NVS 285"; DRIVER="nvidia";;
014A) NAME="Quadro NVS 440"; DRIVER="nvidia";;
018C) NAME="Quadro NVS 50 PCI"; DRIVER="nvidia";;
018A) NAME="Quadro NVS with AGP8X"; DRIVER="nvidia";;

# Unsupported Cards
0221) NAME="GeForce 6200"; DRIVER="ask";;

*) NAME="Unknown NVIDIA Card"; DRIVER="nv";;
esac

if [ $DRIVER = "ask" ]; then
	echo "Your Card isn't supported by the linux nvidia driver."
	echo ""
	DRIVER="nv"
fi

echo "Detected Card: $NAME"
echo "Driver: $DRIVER"
echo "PCI ID: $ID3"
