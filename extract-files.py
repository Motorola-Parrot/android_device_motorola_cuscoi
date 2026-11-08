#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_star import (
    extract_star_firmware,
    star_firmware_regex,
)

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import lib_fixups
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/motorola/sm6450-common',
    'hardware/motorola',
    'hardware/qcom-caf/sm8450-6.6',
    'hardware/qcom-caf/wlan',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/qcom/opensource/dataservices',
]

blob_fixups: blob_fixups_user_type = {
    ('vendor/bin/hw/android.hardware.biometrics.fingerprint@2.1-goodixservice',
        'vendor/bin/hw/android.hardware.biometrics.fingerprint-service-jv', 'vendor/lib64/libgf_hal.so'): blob_fixup()
        .binary_regex_replace(b'(?<=\x00)/default\x00', b'/wrapper\x00'),
    'vendor/etc/vintf/manifest/manifest_IMoto_Fingerprint.xml': blob_fixup()
        .regex_replace('IFingerprint/default', 'IFingerprint/wrapper')
        .regex_replace('<instance>default</instance>', '<instance>wrapper</instance>'),
    'vendor/lib64/libBSTSWAD.so': blob_fixup()
        .clear_symbol_version('AHardwareBuffer_allocate')
        .clear_symbol_version('AHardwareBuffer_describe')
        .clear_symbol_version('AHardwareBuffer_lock')
        .clear_symbol_version('AHardwareBuffer_lockPlanes')
        .clear_symbol_version('AHardwareBuffer_release')
        .clear_symbol_version('AHardwareBuffer_unlock'),
   ('vendor/lib64/hw/com.qti.chi.override.so', 'vendor/lib64/camera/components/com.qti.node.dewarp.so', 'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so'): blob_fixup()
        .replace_needed('android.hardware.camera.common-V2-ndk.so', 'android.hardware.camera.common-V1-ndk.so')
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so'),
    'vendor/lib64/libcamximageformatutils.so': blob_fixup()
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so')
}

extract_fns: extract_fns_user_type = {
    star_firmware_regex: extract_star_firmware,
}

module = ExtractUtilsModule(
    'cuscoi',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    extract_fns=extract_fns,
    add_firmware_proprietary_file=True,
    add_generated_carriersettings=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
