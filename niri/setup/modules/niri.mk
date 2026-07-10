NIRI_WANTS_DIR := $(SYSTEMD_USER_DIR)/niri.service.wants

TARGETS += install-systemd-unit.niri
.PHONY: install-systemd-unit.niri
install-systemd-unit.niri:  $(NIRI_WANTS_DIR)/noctalia.service $(NIRI_WANTS_DIR)/xrdb.service

$(NIRI_WANTS_DIR)/noctalia.service: $(SYSTEMD_USER_DIR)/noctalia.service $(NIRI_WANTS_DIR)
	ln -s $(SYSTEMD_USER_DIR)/noctalia.service $(NIRI_WANTS_DIR)/
$(NIRI_WANTS_DIR)/xrdb.service: $(SYSTEMD_USER_DIR)/xrdb.service $(NIRI_WANTS_DIR)
	ln -s $(SYSTEMD_USER_DIR)/xrdb.service $(NIRI_WANTS_DIR)/
# no longer need to start xwayland-satellite manually in new niri versions
# this is not used before, actually
# $(NIRI_WANTS_DIR)/xwayland-satellite.service: $(SYSTEMD_USER_DIR)/xwayland-satellite.service
	# ln -s $(SYSTEMD_USER_DIR)xwayland-satellite.service $(NIRI_WANTS_DIR)

$(NIRI_WANTS_DIR):
	mkdir -p $(NIRI_WANTS_DIR)
