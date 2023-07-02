use v6.d;
use SOD::Raw;
unit module SOD;
class Image {
    has $.cimage handles <w h c data>;
    method empty(::?CLASS:U: :w($width), :h($height), :c($channels) = 3) {
        my $cimage = make_empty_image($width, $height, $channels);
        self.new(:$cimage);
    }

    method zeros(::?CLASS:U: :w($width), :h($height), :c($channels) = 3) {
        my $cimage = make_zeros_image($width, $height, $channels);
        self.new(:$cimage);
    }

    method random(::?CLASS:U: :w($width), :h($height), :c($channels) = 3) {
        my $cimage = make_random_image($width, $height, $channels);
        self.new(:$cimage);
    }

    method load(::?CLASS:U: Str $filename, Int :$channels = 3) {
        my $cimage = load_image($filename, $channels);
        self.new(:$cimage);
    }

    method load_gray(::?CLASS:U: Str $filename) {
        my $cimage = load_image($filename, 1);
        self.new(:$cimage);
    }

    multi method save_png(Str $filename --> uint8) {
        my int8  $res = save_as_png(self.cimage, $filename);
        if $res != 0 {
            die "Error saving image to $filename";
        }
        return $res;
    }

    multi method save_jpeg(Str $filename, Int() $quality --> uint8) {
        my int8 $res = save_as_jpeg(self.cimage, $filename, $quality);
        if $res != 0 {
            die "Error saving image to $filename";
        }
        return $res;
    }

    method set_pixel($x, $y, $c,Num() $v) {
        set_pixel(self.cimage, $x, $y, $c, $v);
    }

    method get_pixel($x, $y, $c) {
        get_pixel(self.cimage, $x, $y, $c);
    }

    method raku() {
        my $raku = "Image.new(:w({ self.w }), :h({ self.h }), :c({ self.c }) )";
        return $raku;
    }

}