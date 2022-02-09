#!/bin/zsh
set -euo pipefail

readonly WORK_DIR="$(pwd)"
readonly PATCH_DIR="${WORK_DIR}/third_party"
readonly BUILD_DIR="${WORK_DIR}/temp"
readonly BAZEL_DIR="${BUILD_DIR}/bazel"
readonly BAZEL_BIN="${BUILD_DIR}/bin/bazel"

download_patched_version_of_bazel() {

    # Download version 4.1.0.
    # This will be used to build the patched version.
    mkdir -p "${BAZEL_DIR}/4.1.0-temp"
    cd "${BAZEL_DIR}/4.1.0-temp"
    wget --no-check-certificate -O bazel "https://github.com/bazelbuild/bazel/releases/download/4.1.0/bazel-4.1.0-darwin-x86_64"
    chmod +x bazel

    # Clone 4.1.0 version and apply the patch to it. 
    cd "${BAZEL_DIR}"
    git clone --branch "4.1.0" --depth 1 https://github.com/bazelbuild/bazel.git "4.1.0"
    cd "4.1.0"
    git apply "${PATCH_DIR}/arm64-bazel-4.1.0.patch"

    # Build 4.1.0-patched using 4.1.0 downloaded at step 1.
    "${BAZEL_DIR}"/4.1.0-temp/bazel build --incompatible_restrict_string_escapes=false -c opt //src:bazel
    mkdir -p "$(dirname ${BAZEL_BIN})"
    cp bazel-bin/src/bazel "${BAZEL_BIN}"
    chmod +x "${BAZEL_BIN}"

    # Consider cleanup, as 4.1.0 is not used.
    cd "${WORK_DIR}"
}

if [ ! -f "$BAZEL_BIN" ]
then
    echo "Installing patched Bazel."
    download_patched_version_of_bazel
else
    echo "Skipping Bazel installation."
fi