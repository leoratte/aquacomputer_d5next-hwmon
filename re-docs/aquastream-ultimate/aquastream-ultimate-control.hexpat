struct Flow_sensor {
    be u16 ticks_per_liter;
    u16 correction_factor;
};

struct CURVE_mode {
    be u16 start_temp;
    be u16 temp[16];
    be u16 percent[16];
};

struct TEMP_TARGET_mode {
    be u16 temp_target;
    be u16 P;
    be u16 I;
    be u16 D1;
    be u16 D2;
    be u16 hysteresis;
};

struct Display_chart {
    be u16 data_source;
    be u16 update_interval;
};

u8 aquabus_address @ 0x3;
u8 pump_mode @ 0x5;
be u16 pump_pwm @ 0x6;
be u16 pump_flow_target @ 0xa;
u8 pump_flow_src @ 0xd;
Flow_sensor flow_sensor @ 0xe;
u16 temp_sensors[4] @ 0x14;
u8 water_temp_src @ 0x1c;
u8 software_sensor_src @ 0x1d;

u8 display_temp_unit @ 0x1e;
u8 display_flow_unit @ 0x1f;
u8 display_next_page_after @ 0x21;
u32 display_pages_flags @ 0x22;
u8 display_brightness @ 0x2a;
u8 display_brightness_idle @ 0x2b;
u8 display_flags @ 0x30;
Display_chart display_chart[4] @ 0x31;

u8 fan_dc_pwm @ 0x41;
u8 fan_flags @ 0x42;
be u16 fan_min_power @ 0x43;
be u16 fan_max_power @ 0x45;
be u16 fan_max_speed @ 0x47;
u8 fan_mode @ 0x49;
be u16 fan_pwm @ 0x4a;

u8 pump_temp_src @ 0x4d;
CURVE_mode pump_curve_mode @ 0x52;
TEMP_TARGET_mode pump_temp_target @ 0x94;

u8 fan_temp_src @ 0xa3;
be u16 fan_two_point_start @ 0xa4;
be u16 fan_two_point_stop @ 0xa6;
CURVE_mode fan_curve_mode @ 0xa8;
TEMP_TARGET_mode fan_temp_target @ 0xea;

u8 alarm_actions @ 0xf8;
u8 alarm_settings_flags @ 0xfa;
be u16 alarm_flow_rate[2] @ 0xfb;
be u16 alarm_max_temp[4] @ 0xff;
u8 profile @ 0x107;
u8 checksum[2] @ 0x108;
