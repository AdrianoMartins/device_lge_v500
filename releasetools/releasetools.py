# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def FullOTA_InstallBegin(info):
  info.script.AppendExtra('ifelse(is_mounted("/system"),unmount("/system"),ui_print(""));')
  info.script.AppendExtra('ui_print("Installing Android 5.x");')

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('ifelse(is_mounted("/system"),ui_print(""),mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system", "max_batch_time=0,commit=1,data=ordered,barrier=1,errors=panic,nodelalloc"));')
  info.script.AppendExtra('ui_print("Installation Complete");')
  