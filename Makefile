CXX = g++

BASE_CXXFLAGS = -std=c++17 -Wall -O2
BASE_LDFLAGS = -lboost_system -lpthread
CXXFLAGS = $(BASE_CXXFLAGS)

LDFLAGS = $(BASE_LDFLAGS)



SRC_DIR = src
BUILD_DIR = build

INCLUDES = -I$(SRC_DIR)
TARGET = $(BUILD_DIR)/notes_api

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))



all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(dir $@)
	$(CXX) $^ -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

run: $(TARGET)
		$(TARGET)

clean:
	rm -rf $(BUILD_DIR)

install-deps:
	@echo "Installing dependencies using install_deps.sh..."

.PHONY: all clean install-deps run