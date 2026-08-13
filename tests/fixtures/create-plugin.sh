#!/bin/bash
# Creates a minimal valid IntelliJ plugin ZIP for testing purposes.
# The plugin ZIP must contain a META-INF/plugin.xml file.

set -e

PLUGIN_DIR="/tmp/test-plugin"
PLUGIN_ZIP="/tmp/test-plugin.zip"

mkdir -p "$PLUGIN_DIR/META-INF"

cat > "$PLUGIN_DIR/META-INF/plugin.xml" << 'EOF'
<idea-plugin>
  <id>com.example.testplugin</id>
  <name>Test Plugin</name>
  <version>1.0.0</version>
  <vendor>Test Vendor</vendor>
  <description>A minimal test plugin for CI testing.</description>
  <idea-version since-build="231"/>
  <depends>com.intellij.modules.platform</depends>
</idea-plugin>
EOF

cd "$PLUGIN_DIR"
zip -r "$PLUGIN_ZIP" META-INF/

echo "Created plugin ZIP at $PLUGIN_ZIP"
ls -lh "$PLUGIN_ZIP"
