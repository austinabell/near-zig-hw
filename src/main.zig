const std = @import("std");
const allocator = std.heap.page_allocator;

export fn hello() void {
    const input_buffer = input_bytes();
    
    const Input = struct { name: []u8 };
    var stream = std.json.TokenStream.init(input_buffer);
    const parsedData = std.json.parse(Input, &stream, .{ .allocator = allocator }) catch unreachable;

    log_str(prefix_hello(parsedData.name));
}

fn prefix_hello(msg: []u8) []u8 {
    const greeting: []const u8 = &"Hello ".*;
    
    const buf = allocator.alloc(u8, msg.len+greeting.len) catch unreachable;
    std.mem.copy(u8, buf, greeting);
    std.mem.copy(u8, buf[greeting.len..], msg);
    return buf;
}

fn log_str(msg: []u8) void {
    log_utf8(msg.len, @ptrToInt(msg.ptr));
}

fn input_bytes() []u8 {
    const REGISTER_ID: u64 = 0;

    // Load input into register.
    input(REGISTER_ID);

    // Retrieve register length.
    const len = @truncate(usize, register_len(REGISTER_ID));

    // Create buffer with dynamic allocation and read bytes into buffer.
    const buf = allocator.alloc(u8, len) catch unreachable;
    read_register(REGISTER_ID, @ptrToInt(buf.ptr));
    return buf;
}

extern fn read_register(u64, u64) void;
extern fn register_len(u64) u64;
extern fn input(u64) void;
extern fn log_utf8(u64, u64) void;
