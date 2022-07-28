(*
  -- FRAME_IT_OPTIONS: options for the frame_it script
  -- usage: frame_it [ OPTIONS ] image [ .. ]
  --
  -- OPTIONS:
  --
  -- -d | --dropshadow         specifies a drop shadow (offset bottom and right) vs
  --                           the default that centers the image in an all-edges shadow
  --
  -- -o | --overwrite          specifies to overwrite the original files vs the default
  --                           of keeping them and writing new files with "-frame" inserted
  --                           before the suffix
  --
  -- -p | --picture            add a 1-pixel black inner border + 10-pixel white outer border
  --
  -- -f=font |                 specify the font to use for the two-row label text logo
  -- --font=font
  --
  -- -t | --text               specifies to use a two-line text logo underneath the image
  --
  -- -ot | --overlaytext       specifies to use a two-line text logo inside the image
  --
  -- -tc=color |               specifies the color of the two-line text logo
  -- --textcolor=color         default #383838 below image, #E0E0E0 inside image
  --
  -- -l | --logo               specifies to place an image-based logo underneath the image
  --                           DEFAULT style when no options are specified
  --
  -- -ol | --overlaylogo       specifies to place an image-based logo inside the image
  --
  -- -mc=color |               specifies the color of the matte background (default white)
  -- --mattecolor=color
  --
  -- -w=your_logo |            specifies the image-based logo to use as the watermark that
  -- --watermark=your_logo     that is placed below or inside the image.
  --
  -- -g=placement |            specifies which inside edge or corner of the image the logo
  -- --gravity=placement       or text should be nearest. The following are accepted values.
  --                           The logo or text is inset from the specified edge or corner.
  --                           DEFAULT edge is south/bottom.
  --
  --                             +----------------------------------------------------+
  --                             | topleft               top                 topright |
  --                             |                                                    |
  --                             | left                 middle                  right |
  --                             |                                                    |
  --                             | bottomleft           bottom            bottomright |
  --                             +----------------------------------------------------+
  --
  --                             +----------------------------------------------------+
  --                             | northwest            north               northeast |
  --                             |                                                    |
  --                             | west                 center                   east |
  --                             |                                                    |
  --                             | southwest            south               southeast |
  --                             +----------------------------------------------------+
  --
*)

set optionsList to &
  { |logo_over_white|: "-o -ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_white_drop|: "-o -ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_white_pic: "-o -ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_white_drop_pic| : "-o -ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png" } &

  { |logo_over_gray| : "-o -ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_gray_drop| : "-o -ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_gray_pic| : "-o -ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png" } &
  { |logo_over_gray_drop_pic| : "-o -ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png" } &

  { |logo_white| : "-o -l -mc=#ffffff -w=~/Pictures/watermark_gray.png" } &
  { |logo_white_drop| : "-o -l -d -mc=#ffffff -w=~/Pictures/watermark_gray.png" } &
  { |logo_white_pic| : "-o -l -p -mc=#ffffff -w=~/Pictures/watermark_gray.png" } &
  { |logo_white_drop_pic| : "-o -l -d -p -mc=#ffffff -w=~/Pictures/watermark_gray.png" } &

  { |logo_gray| : "-o -l -mc=#383838 -w=~/Pictures/watermark_white.png" } &
  { |logo_gray_drop| : "-o -l -d -mc=#383838 -w=~/Pictures/watermark_white.png" } &
  { |logo_gray_pic| : "-o -l -p -mc=#383838 -w=~/Pictures/watermark_white.png" } &
  { |logo_gray_drop_pic| : "-o -l -d -p -mc=#383838 -w=~/Pictures/watermark_white.png" } &

  { |text_over_white| : "-o -ot -mc=#ffffff -g=south -d -tc=#E0E0E0" } &
  { |text_over_white_drop| : "-o -ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0" } &
  { |text_over_white_pic| : "-o -ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0" } &
  { |text_over_white_drop_pic| : "-o -ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0" } &

  { |text_over_gray| : "-o -ot -mc=#383838 -g=south -d -tc=#E0E0E0" } &
  { |text_over_gray_drop| : "-o -ot -d -mc=#383838 -g=south -d -tc=#E0E0E0" } &
  { |text_over_gray_pic| : "-o -ot -p -mc=#383838 -g=south -d -tc=#E0E0E0" } &
  { |text_over_gray_drop_pic| : "-o -ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0" } &

  { |text_white| : "-o -t -mc=#ffffff -tc=#383838" } &
  { |text_white_drop| : "-o -t -d -mc=#ffffff -tc=#383838" } &
  { |text_white_pic| : "-o -t -p -mc=#ffffff -tc=#383838" } &
  { |text_white_drop_pic| : "-o -t -d -p -mc=#ffffff -tc=#383838" } &

  { |text_white_drop_pic| : "-o -t -mc=#383838 -tc=#E0E0E0" } &
  { |text_white_drop_pic| : "-o -t -d -mc=#383838 -tc=#E0E0E0" } &
  { |text_white_drop_pic| : "-o -t -p -mc=#383838 -tc=#E0E0E0" } &
  { |text_white_drop_pic| : "-o -t -d -p -mc=#383838 -tc=#E0E0E0" }
