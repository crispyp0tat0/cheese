# Compiler and flags
CC := gcc
CFLAGS := -Wall -Wextra -Iinclude -g

# Directories
SRC_DIR := src
INC_DIR := include
BUILD_DIR := build

# Source and object files
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# Output binary
TARGET := $(BUILD_DIR)/main

# Default rule
all: $(TARGET)

# Link object files to create the binary
$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(OBJS) -o $@

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean
