use v6.d;
use SOD::Raw;
unit module SOD:ver<0.2.1-dev>:auth<zef:khalidelborai>:api<1.0>;

subset Scale of Num where 0 <=* <= 1;

class Image {
	has CImage $.cimage handles <w h c data>;

	method load(::?CLASS:U: Str $filename, Int :$channels = 3 --> Image) {
		my $cimage = load_image($filename, $channels);
		self.new(:$cimage);
	}

	method load_gray(::?CLASS:U: Str $filename --> Image) {
		my $cimage = load_image($filename, 1);
		self.new(:$cimage);
	}

	method empty(::?CLASS:U: :w($width), :h($height), :c($channels) = 3 --> Image) {
		my $cimage = make_empty_image($width, $height, $channels);
		self.new(:$cimage);
	}

	method zeros(::?CLASS:U: :w($width), :h($height), :c($channels) = 3 --> Image) {
		my $cimage = make_zeros_image($width, $height, $channels);
		self.new(:$cimage);
	}

	method random(::?CLASS:U: :w($width), :h($height), :c($channels) = 3 --> Image) {
		my $cimage = make_random_image($width, $height, $channels);
		self.new(:$cimage);
	}

	method copy(::?CLASS:D: --> Image) {
		my $cimage = copy_image(self.cimage);
		self.new(:$cimage);
	}

	method clone(::?CLASS:D: --> Image) {
		return self.copy();
	}

	method save_png(Str $filename --> uint8) {
		my int8  $res = save_as_png(self.cimage, $filename);
		if $res != 0 {
			die "Error saving image to $filename";
		}
		return $res;
	}

	method save_jpeg(Str $filename, Int() $quality --> uint8) {
		my int8 $res = save_as_jpeg(self.cimage, $filename, $quality);
		if $res != 0 {
			die "Error saving image to $filename";
		}
		return $res;
	}

	method save_bmp(Str $filename --> uint8) {
		my int8 $res = save_as_bmp(self.cimage, $filename);
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

	method resize(::?CLASS:D: Int() $w, Int() $h --> Image) {
		$!cimage = resize(self.cimage, $w, $h);
		self;
	}

	method resize_max(::?CLASS:D: Int() $max --> Image) {
		$!cimage = resize_max(self.cimage, $max);
		self
	}

	method resize_min(::?CLASS:D: Int() $min --> Image) {
		$!cimage = resize_min(self.cimage, $min);
		self;
	}

	method rotate_crop(::?CLASS:D: Num() :a($angle), Scale() :s($scale) , Int() :w($width), Int() :h($height),
	                   Int() :x($dx), Int() :y($dy),Num() :as($aspect) --> Image) {
		$!cimage = rotate_crop(self.cimage, $angle, $scale, $width, $height, $dx, $dy, $aspect);
		self;
	}

	method translate(::?CLASS:D: Scale() $scale --> Image) {
		translate(self.cimage, $scale);
		self;
	}

	method scale(::?CLASS:D: Scale() $scale --> Image) {
		scale(self.cimage, $scale);
		self;
	}

	method normalize(::?CLASS:D: --> Image) {
		normalize(self.cimage);
		self;
	}

	method transpose(::?CLASS:D: --> Image) {
		transpose(self.cimage);
		self;
	}

	method rotate(::?CLASS:D: Num() $angle --> Image) {
		my $cimage = rotate(self.cimage, $angle);
		self.new(:$cimage);
	}

	method box(::?CLASS:D: Int() $x1, Int() $y1, Int() $x2, Int() $y2, Num() $r, Num() $g, Num() $b --> Image) {
		draw_box(self.cimage, $x1, $y1, $x2, $y2, $r, $g, $b);
		self;
	}

	multi method bbox(::?CLASS:D: Box $box, Num() $r, Num() $g, Num() $b --> Image) {
		draw_bbox(self.cimage, $box, $r, $g, $b);
		self;
	}

	multi method bbox(::?CLASS:D: Box $box, Num() $r, Num() $g, Num() $b, Num() $w --> Image) {
		draw_bbox_width(self.cimage, $box, $r, $g, $b, $w);
		self;
	}

	method box_grayscale(::?CLASS:D: Int() $x1, Int() $y1, Int() $x2, Int() $y2, Num() $v --> Image) {
		draw_box_grayscale(self.cimage, $x1, $y1, $x2, $y2, $v);
		self;
	}

	multi method circle(::?CLASS:D: Int() $x, Int() $y, Int() $radius, Num() $r, Num() $g, Num() $b --> Image) {
		draw_circle(self.cimage, $x, $y, $radius, $r, $g, $b);
		self;
	}

	multi method circle(::?CLASS:D: Int() $x, Int() $y, Int() $radius,Int() $thickness, Num() $r, Num() $g,
	                    Num() $b,  --> Image) {
		draw_circle_thickness(self.cimage, $x, $y, $radius, $thickness, $r, $g, $b);
		self;
	}

	method crop(::?CLASS:D: Int() $x, Int() $y, Int() $w, Int() $h --> Image) {
		$!cimage = crop(self.cimage, $x, $y, $w, $h);
		self;
	}

	method random_crop(::?CLASS:D: Int() $w, Int() $h --> Image) {
		$!cimage = random_crop(self.cimage, $w, $h);
		self;
	}

	method random_augment(::?CLASS:D: Num() $angel, Num() $aspect, Int() $low, Int() $high, Int() $size --> Image) {
		$!cimage = random_augment(self.cimage, $angel, $aspect, $low, $high, $size);
		self;
	}

	method DESTROY(::?CLASS:D:) {
		free_image(self.cimage);
	}

}


