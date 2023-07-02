use v6.d;

use NativeCall;

class CImage is repr('CStruct') {
    has int32 $.h;
    has int32 $.w;
    has int32 $.c;
    HAS Pointer[num32] $.data;
}

sub make_empty_image(int32,int32,int32) returns CImage is native("$*CWD/sod") is export {*}

sub make_zeros_image(int32,int32,int32) returns CImage is native("$*CWD/sod") is export {*}

sub make_random_image(int32,int32,int32,) returns CImage is native("$*CWD/sod") is export {*}

sub load_image(Str,int32,) returns CImage is native("$*CWD/sod") is export {*}

sub save_as_png(CImage,Str,--> int8) is native("$*CWD/sod") is export {*}

sub save_as_jpeg(CImage,Str,int32--> int8) is native("$*CWD/sod") is export {*}

sub get_pixel(CImage,int32,int32,int32) returns num32 is native("$*CWD/sod") is export {*}

sub set_pixel(CImage,int32,int32,int32,num32) returns num32 is native("$*CWD/sod") is export {*}
