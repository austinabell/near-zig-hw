const std = @import("std");

export fn hello() void {
    // // TODO this allocator is prob large compiled
    // var arena = std.heap.ArenaAllocator.init(std.heap.c_allocator);
    // defer arena.deinit();
    // const Foo = struct { a: i32, b: bool, c: []u8 };
    // const s =
    //     \\ {
    //     \\   "a": 15, "b": true,
    //     \\   "c": "hello world"
    //     \\ }
    // ;
    // var stream = std.json.TokenStream.init(s);
    // _ = std.json.parse(Foo, &stream, .{ .allocator = arena.allocator() }) catch unreachable;
    // defer std.json.parseFree(Foo, parsedData, .{ .allocator = *gpa.allocator() });
    var msg: [11]u8 = "hello world".*;
    log_str(&msg);
}

fn log_str(msg: []u8) void {
    log_utf8(msg.len, @ptrToInt(msg.ptr));
}

// extern fn read_register(u64, u64) void;
// extern fn register_len(u64) u64;
// extern fn input(u64) void;
extern fn log_utf8(u64, u64) void;
