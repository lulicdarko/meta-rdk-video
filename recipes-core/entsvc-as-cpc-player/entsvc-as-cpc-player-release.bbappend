FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

DEPENDS:remove = "aamp fog"
# nettle: sha3.h for TriggerModuleManager; googletest: GTest for comptests build
DEPENDS:append = " nettle googletest"

# Install stub fogiarm.h into sysroot (fog package not available).
# Source needs it: jspp/JsppPlayer_p.cpp, mocks/MockIARM.h, and
# comptestmocks/fogiarm.h does #include_next <fogiarm.h>.
do_configure:prepend() {
    install -d ${STAGING_INCDIR}
    install -m 0644 ${WORKDIR}/fogiarm.h ${STAGING_INCDIR}/fogiarm.h
}

SRC_URI:append = " file://fogiarm.h"

CXXFLAGS:append = " -Wno-error=switch"
