#!/bin/bash
#
# The D-AI-LY - Automation Installation Script
#
# This script sets up the daily automation using macOS launchd.
#
# Usage:
#   ./install.sh          # Install the daily automation
#   ./install.sh --remove # Remove the automation
#   ./install.sh --status # Check if automation is running
#   ./install.sh --test   # Run the pipeline once (for testing)
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLIST_NAME="com.the-daily.pipeline.plist"
PLIST_SRC="$SCRIPT_DIR/$PLIST_NAME"
PLIST_DEST="$HOME/Library/LaunchAgents/$PLIST_NAME"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

install_automation() {
    echo ""
    echo "Installing The D-AI-LY automation..."
    echo ""

    # Check if plist source exists
    if [ ! -f "$PLIST_SRC" ]; then
        print_error "Plist file not found: $PLIST_SRC"
        exit 1
    fi

    # Check if already installed
    if [ -f "$PLIST_DEST" ]; then
        print_warning "Automation already installed. Updating..."
        launchctl unload "$PLIST_DEST" 2>/dev/null || true
    fi

    # Create LaunchAgents directory if needed
    mkdir -p "$HOME/Library/LaunchAgents"

    # Copy plist
    cp "$PLIST_SRC" "$PLIST_DEST"
    print_status "Plist copied to $PLIST_DEST"

    # Load the agent
    launchctl load "$PLIST_DEST"
    print_status "Agent loaded"

    # Verify
    if launchctl list | grep -q "com.the-daily.pipeline"; then
        print_status "Automation installed successfully!"
    else
        print_warning "Agent loaded but not appearing in list (may be normal)"
    fi

    echo ""
    echo "The D-AI-LY will run daily at 8:00 AM."
    echo ""
    echo "Commands:"
    echo "  ./install.sh --status  # Check status"
    echo "  ./install.sh --test    # Run pipeline now"
    echo "  ./install.sh --remove  # Uninstall"
    echo ""
}

remove_automation() {
    echo ""
    echo "Removing The D-AI-LY automation..."
    echo ""

    if [ -f "$PLIST_DEST" ]; then
        launchctl unload "$PLIST_DEST" 2>/dev/null || true
        rm "$PLIST_DEST"
        print_status "Automation removed"
    else
        print_warning "Automation not installed"
    fi

    echo ""
}

check_status() {
    echo ""
    echo "The D-AI-LY Automation Status"
    echo "=============================="
    echo ""

    if [ -f "$PLIST_DEST" ]; then
        print_status "Plist installed: $PLIST_DEST"
    else
        print_warning "Plist not installed"
        echo ""
        return
    fi

    if launchctl list | grep -q "com.the-daily.pipeline"; then
        print_status "Agent is loaded and scheduled"
    else
        print_warning "Agent not loaded (may run at next scheduled time)"
    fi

    echo ""
    echo "Next run: 8:00 AM daily"
    echo ""

    # Check recent logs
    LOG_DIR="$SCRIPT_DIR/logs"
    if [ -d "$LOG_DIR" ]; then
        LATEST_LOG=$(ls -t "$LOG_DIR"/pipeline_*.log 2>/dev/null | head -1)
        if [ -n "$LATEST_LOG" ]; then
            echo "Latest log: $LATEST_LOG"
            echo ""
            echo "Last 5 lines:"
            tail -5 "$LATEST_LOG"
        fi
    fi

    echo ""
}

run_test() {
    echo ""
    echo "Running The D-AI-LY pipeline (test mode)..."
    echo ""

    "$SCRIPT_DIR/run_pipeline.sh" --prep-only

    echo ""
    echo "Test complete. To generate article, run:"
    echo "  claude \"/the-daily-generator TABLE_NUMBER\""
    echo ""
}

# Parse arguments
case "${1:-}" in
    --remove)
        remove_automation
        ;;
    --status)
        check_status
        ;;
    --test)
        run_test
        ;;
    --help|-h)
        echo "Usage: $0 [--remove|--status|--test|--help]"
        echo ""
        echo "Options:"
        echo "  (none)    Install automation"
        echo "  --remove  Uninstall automation"
        echo "  --status  Check automation status"
        echo "  --test    Run pipeline once (prep-only mode)"
        echo "  --help    Show this help"
        ;;
    *)
        install_automation
        ;;
esac
