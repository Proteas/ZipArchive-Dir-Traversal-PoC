export DEVELOPER_DIR := $(shell xcode-select --print-path)

# OS X
SDK_OSX 		= $(shell xcodebuild -version -sdk macosx Path)
MIN_VER_OSX		= -mmacosx-version-min=10.8

ARCH_OSX		= -arch x86_64
CC_OSX			= $(shell xcrun --sdk macosx --find clang)

SDK_SETTINGS_OSX = -isysroot $(SDK_OSX) -I$(SDK_OSX)/usr/include -I$(SDK_OSX)/usr/local/include

COMPILE_OSX_BIN	= $(CC_OSX) $(ARCH_OSX) $(MIN_VER_OSX) $(SDK_SETTINGS_OSX)
# ================================================================================================= #

HEADER_SEARCH_PATH		= -I.
LIB_SEARCH_PATH			= -L.
FRAMEWORK_SEARCH_PATH 	= -F.

CFLAGS					= 
LDFLAGS					= -lz
FRMKFLAGS				= -framework Foundation -framework ZipArchive
# ================================================================================================= #

TARGET		= za-unzip
MAIN_FILE	= main.m

osx: $(MAIN_FILE)
	$(COMPILE_OSX_BIN) -o $(TARGET) $(MAIN_FILE) $(HEADER_SEARCH_PATH) $(LIB_SEARCH_PATH) $(FRAMEWORK_SEARCH_PATH) $(CFLAGS) $(LDFLAGS) $(FRMKFLAGS)
	
clean:
	rm -rf $(TARGET) $(TARGET).dSYM
	