# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=release_64bit
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

ifeq ($(origin CC), default)
  CC = clang
endif
ifeq ($(origin CXX), default)
  CXX = clang++
endif
ifeq ($(origin AR), default)
  AR = ar
endif
INCLUDES += -I../../src/include
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),release_64bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test
OBJDIR = obj/64bit/Release/wren_test
DEFINES += -DNDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O2
LIBS += ../../lib/libwren.a
LDDEPS += ../../lib/libwren.a
ALL_LDFLAGS += $(LDFLAGS) -m64

else ifeq ($(config),release_32bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test
OBJDIR = obj/32bit/Release/wren_test
DEFINES += -DNDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -O2
LIBS += ../../lib/libwren.a
LDDEPS += ../../lib/libwren.a
ALL_LDFLAGS += $(LDFLAGS) -m32

else ifeq ($(config),release_64bit-no-nan-tagging)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test
OBJDIR = obj/64bit-no-nan-tagging/Release/wren_test
DEFINES += -DNDEBUG -DWREN_NAN_TAGGING=0
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O2
LIBS += ../../lib/libwren.a
LDDEPS += ../../lib/libwren.a
ALL_LDFLAGS += $(LDFLAGS)

else ifeq ($(config),debug_64bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test_d
OBJDIR = obj/64bit/Debug/wren_test
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -g
LIBS += ../../lib/libwren_d.a
LDDEPS += ../../lib/libwren_d.a
ALL_LDFLAGS += $(LDFLAGS) -m64

else ifeq ($(config),debug_32bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test_d
OBJDIR = obj/32bit/Debug/wren_test
DEFINES += -DDEBUG
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -g
LIBS += ../../lib/libwren_d.a
LDDEPS += ../../lib/libwren_d.a
ALL_LDFLAGS += $(LDFLAGS) -m32

else ifeq ($(config),debug_64bit-no-nan-tagging)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_test_d
OBJDIR = obj/64bit-no-nan-tagging/Debug/wren_test
DEFINES += -DDEBUG -DWREN_NAN_TAGGING=0
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -g -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -g
LIBS += ../../lib/libwren_d.a
LDDEPS += ../../lib/libwren_d.a
ALL_LDFLAGS += $(LDFLAGS)

else
  $(error "invalid configuration $(config)")
endif

# Per File Configurations
# #############################################


# File sets
# #############################################

OBJECTS :=

OBJECTS += $(OBJDIR)/api_tests.o
OBJECTS += $(OBJDIR)/benchmark.o
OBJECTS += $(OBJDIR)/call.o
OBJECTS += $(OBJDIR)/call_calls_foreign.o
OBJECTS += $(OBJDIR)/call_wren_call_root.o
OBJECTS += $(OBJDIR)/error.o
OBJECTS += $(OBJDIR)/foreign_class.o
OBJECTS += $(OBJDIR)/get_variable.o
OBJECTS += $(OBJDIR)/handle.o
OBJECTS += $(OBJDIR)/lists.o
OBJECTS += $(OBJDIR)/main.o
OBJECTS += $(OBJDIR)/new_vm.o
OBJECTS += $(OBJDIR)/reset_stack_after_call_abort.o
OBJECTS += $(OBJDIR)/reset_stack_after_foreign_construct.o
OBJECTS += $(OBJDIR)/resolution.o
OBJECTS += $(OBJDIR)/slots.o
OBJECTS += $(OBJDIR)/test.o
OBJECTS += $(OBJDIR)/user_data.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking wren_test
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning wren_test
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/api_tests.o: ../../test/api/api_tests.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/benchmark.o: ../../test/api/benchmark.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call.o: ../../test/api/call.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call_calls_foreign.o: ../../test/api/call_calls_foreign.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/call_wren_call_root.o: ../../test/api/call_wren_call_root.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/error.o: ../../test/api/error.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/foreign_class.o: ../../test/api/foreign_class.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/get_variable.o: ../../test/api/get_variable.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/handle.o: ../../test/api/handle.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/lists.o: ../../test/api/lists.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/new_vm.o: ../../test/api/new_vm.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/reset_stack_after_call_abort.o: ../../test/api/reset_stack_after_call_abort.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/reset_stack_after_foreign_construct.o: ../../test/api/reset_stack_after_foreign_construct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/resolution.o: ../../test/api/resolution.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/slots.o: ../../test/api/slots.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/user_data.o: ../../test/api/user_data.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/main.o: ../../test/main.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/test.o: ../../test/test.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif