#seven
include $(TOPDIR)/rules.mk
#include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:= wisapps
PKG_RELEASE:=1
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk
#PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

define Package/wisapps
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=WisAp apps and utils
	DEPENDS:=+libuci +libpthread +librt
endef

define Package/wisapps/description
	WisAp apps
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	$(CP) ./src/* $(PKG_BUILD_DIR)/src/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)"
endef

	#$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
define Package/wisapps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/wiskey
	
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/msload_go.sh $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wifistatus.sh $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/recoverboard.sh $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/gpio_ctrl $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/luci_service $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/unabto_tunnel $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/reset_lgw.sh $(1)/usr/bin


	$(CP) $(PKG_BUILD_DIR)/src/version $(1)/etc/wiskey
	
	$(INSTALL_DIR) $(1)/etc
	

endef
	
$(eval $(call BuildPackage,wisapps))

