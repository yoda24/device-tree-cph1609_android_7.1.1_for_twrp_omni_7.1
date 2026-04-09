# TWRP Device Tree for OPPO F3 (CPH1609)

TWRP for OPPO F3 (CPH1609) with MediaTek MT6750 chipset.

## Specifications

| Component | Details |
|-----------|---------|
| Device | OPPO F3 (CPH1609) |
| Chipset | MediaTek MT6750 |
| Display | 5.5" Full HD (1080x1920) |
| RAM | 4 GB |
| Android | 7.1.1 Nougat |

## Status

- TWRP boots normally
- Touchscreen works
- Mount system, cache, data
- Backup & restore
- Flash zip files
- ADB working
- MTP working

## How to Build TWRP from Source

### Prerequisites

- Ubuntu 18.04 / 20.04 / 22.04 (or WSL)
- Python 3.6+
- Java 8
- repo tool
- MTKClient
- Stable internet connection

### Setup Environment

**Install dependencies:**
sudo apt update
sudo apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig python2 python3

**Install repo tool:**
mkdir -p ~/.bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo
chmod a+x ~/.bin/repo
export PATH="$HOME/.bin:$PATH"

### Download TWRP Source

mkdir ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-7.1
repo sync -c --force-sync --no-tags -j$(nproc)

### Clone Device Tree

git clone https://github.com/yoda24/device-tree-cph1609_android_7.1.1_for_twrp_omni_7.1.git device/oppo/CPH1609

### Build TWRP

cd ~/twrp
export LC_ALL=C
source build/envsetup.sh
lunch omni_CPH1609-eng
mka recoveryimage

### Output 

~/twrp/out/target/product/CPH1609/recovery.img

## How to Flash

### Using MTKClient

1. Boot device into BROM mode (power off, press and hold Volume Up + Volume Down, then connect USB)
2. Flash recovery:
   python3 mtk w recovery recovery.img

### Using SP Flash Tool

1. Open SP Flash Tool
2. Load scatter file from stock ROM
3. Check recovery partition
4. Select recovery.img
5. Click Download
6. Power off device, connect USB (press Volume Up/Down)

## Notes

- Before flashing TWRP: Format/erase metadata partition and Bootloader must be unlocked 
- If flex error occurs, run: export LC_ALL=C before build
- **Data partition (internal storage) may not mount due to FBE encryption**
  - To fix: Go to **Wipe** → **Format Data** → type `yes`
  - ⚠️ This will erase all data in internal storage (photos, downloads, etc.)
  - SD card is safe and will not be affected
  - After format, TWRP can access /data normally
- For prevent partition /data forcing to encrypt, flashing boot.img is needed. Get boot.img in releases page. https://github.com/yoda24/device-tree-cph1609_android_7.1.1_for_twrp_omni_7.1/releases

## Credits

- yoda24 (Device Tree maintainer)
- TWRP Team
- OmniROM

## License

GPL v2 (GNU General Public License version 2)
