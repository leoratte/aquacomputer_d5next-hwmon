struct Flow_sensor {
    be u16 ticks_per_liter;
    u16 correction_factor;
};

bitfield Fan_flags {
	hold_min_power : 1;
	start_boost : 1;
};

struct Fan_setup {
    Fan_flags flags;
    be u16 min_percent;
    be u16 max_percent;
    be u16 fallback;
    be u16 graph_rpm;
};

enum Fan_ctrl_mode : u8 {
    PWM,
    TEMP_TARGET,
    CURVE,
    FAN1,
    FAN2,
    FAN3,
    FAN4
};

struct TEMP_TARGET_mode {
    be u16 temp_target;
    be u16 P;
    be u16 I;
    be u16 D1;
    be u16 D2;
    be u16 hysteresis;
};

struct CURVE_mode {
    be u16 start_temp;
    be u16 temp[16];
    be u16 percent[16];
};

struct Fan {
    Fan_ctrl_mode mode;
    be u16 pwm;
    u16 temp_sensor;
    TEMP_TARGET_mode temp_target_vars;
    padding[2];
    CURVE_mode curve_mode_vars;
};

struct RGB {
    u8 brightness;
    padding[1];
    u8 rgb_off;
};

enum RGB_mode : u8 {
    STATIC=0x01,
    BREATHING=0x02,
    ROTATING_RAINBOW=0x03,
    BLINKING=0x04,
    COLOR_CHANGE=0x05,
    SEQUENCE=0x07,
    SCANNER=0x08,
    LASER=0x09,
    WAVE=0x0a,
    COLOR_SEQUENCE=0x0b,
    COLOR_SHIFT=0x0c,
    BAR_GRAPH=0x0d,
    FLAME=0x0e,
    RAIN=0x0f,
    SNOWFALL=0x10,
    STARDUST=0x11,
    COLOR_SWITCH=0x12,
    SWIPING_RAINBOW=0x13,
    SOUND_FLASH=0x14,
    SOUND_BARS=0x15,
    SOUND_SLIDER=0x16,
    SOUND_SHIFT=0x17,
    AMBIENTPX=0x18,
    COLOR_GRADIENT=0x21
};

struct RGB_CONTROLLER {
    padding[1];
    u8 first_led;
    u8 led_count;
    RGB_mode mode;
    padding[2];
    u16 data_src;
    padding[0x26];
    u16 hsv_h;
    u8 hsv_s;
    u8 hsv_v;
    padding[0x14];
};

struct QUADRO {
    u8 ctrl_report_id;
    padding[2];
    u8 aquabus;
    padding[2];
    Flow_sensor flow_sensor;
    u16 temp_sensors[4];
    Fan_setup fan_setups[4];
    Fan fans[4];
    RGB rgb;
    RGB_CONTROLLER rgb_ctrl[8];
    u8 profile;
    padding[1];
    be u16 checksum;
};

QUADRO quadro @ 0x0;
