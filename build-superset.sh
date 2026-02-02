#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Default values
IMAGE_NAME="${IMAGE_NAME:-apache/superset}"
IMAGE_TAG="${IMAGE_TAG:-latest}"
BUILD_TRANSLATIONS="${BUILD_TRANSLATIONS:-false}"
INCLUDE_CHROMIUM="${INCLUDE_CHROMIUM:-false}"
INCLUDE_FIREFOX="${INCLUDE_FIREFOX:-false}"
LOAD_EXAMPLES_DUCKDB="${LOAD_EXAMPLES_DUCKDB:-false}"
TARGET="${TARGET:-lean}"

# Disable Scarf analytics
export SCARF_ANALYTICS=false

echo "========================================"
echo "Building Apache Superset Docker Image"
echo "========================================"
echo "Image: ${IMAGE_NAME}:${IMAGE_TAG}"
echo "Target: ${TARGET}"
echo "Build Translations: ${BUILD_TRANSLATIONS}"
echo "Include Chromium: ${INCLUDE_CHROMIUM}"
echo "Include Firefox: ${INCLUDE_FIREFOX}"
echo "Load Examples DuckDB: ${LOAD_EXAMPLES_DUCKDB}"
echo "Scarf Analytics: ${SCARF_ANALYTICS}"
echo "========================================"
echo ""

docker build \
  --target "${TARGET}" \
  --build-arg BUILD_TRANSLATIONS="${BUILD_TRANSLATIONS}" \
  --build-arg INCLUDE_CHROMIUM="${INCLUDE_CHROMIUM}" \
  --build-arg INCLUDE_FIREFOX="${INCLUDE_FIREFOX}" \
  --build-arg LOAD_EXAMPLES_DUCKDB="${LOAD_EXAMPLES_DUCKDB}" \
  --build-arg SCARF_ANALYTICS=false \
  -t "${IMAGE_NAME}:${IMAGE_TAG}" \
  .

echo ""
echo "========================================"
echo "Build completed successfully!"
echo "Image: ${IMAGE_NAME}:${IMAGE_TAG}"
echo "========================================"
echo ""
echo "To run the image:"
echo "  docker run -p 8088:8088 ${IMAGE_NAME}:${IMAGE_TAG}"
echo ""
