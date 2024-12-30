# At The Command Line

The [frame_it](frame_it) shell script can be used from the command line on macOS and Linux.

Place the [frame_it](frame_it) shell script in /usr/local/bin and run it with no options to see a usage message showing all of the available styling options.

```text
usage: frame_it [ OPTIONS ] image [ .. ]

OPTIONS:

-h | --help               display a usage message with option descriptions

-o | --overwrite          specifies to overwrite the original files vs the default
                          of keeping them and writing new files with "-framed" inserted
                          before the suffix

-s=suffix |               suffix to append to decorated file names (default: "-framed")
--suffix=suffix

-t | --text               specifies to use a two-line text watermark underneath the image

-ot | --overlaytext       specifies to use a two-line text watermark inside the image

-l | --logo               specifies to place an image-based watermark underneath the image
                          DEFAULT style when no options are specified

-ol | --overlaylogo       specifies to place an image-based watermark inside the image

-so | --solid             specifies a plain solid border style without any watermark

-sl | --solid_logo         specifies a plain solid border with graphic watermark underneath

-slo | --solid_logo_overlay   specifies a plain solid border with graphic watermark overlayed on image

-st | --solid_text         specifies a plain solid border with text watermark underneath

-sto | --solid_text_overlay   specifies a plain solid border with text watermark overlayed on image

-f | --frame              add a picture frame around the sides of the image
                          this disables bevel and enables shadowboxing (default no frame)

-b | --bevel              add an interior bevel between the image and surrounding matte.
                          this disables shadowboxing and picture frame. (default no bevel)

-p | --picture            add a wall picture frame outer border for that wall mounted look.
                          this disables shadowboxing and thin frame. (default no bevel)

-d | --dropshadow         specifies a drop shadow (offset bottom and right) vs
                          the default that centers the image in an all-edges shadow

-bc=color |               specifies the color of the interior bevel (default #888888)
--bevelcolor=color

-fc=color |               specifies the color of the inner picture frame (default white)
--framecolor=color

-ic=color |               specifies the color of the inner solid border (default #000000)
--innercolor=color

-mc=color |               specifies the color of the matte background (default white)
--mattecolor=color

-oc=color |               specifies the color of the outer solid border (default #ffffff)
--outercolor=color

-pc=color |               specifies the color of the wall picture frame (default #0a0a0a)
--picturecolor=color

-sc=color |               specifies the color of the shadow (default black)
--shadowcolor=color

-tc=color |               specifies the color of the two-line text watermark
--textcolor=color         default #383838 below image, #E0E0E0 inside image

-tf=font |                specify the font to use for the two-row label text watermark
--textfont=font

-a=ratio |                specify the desired aspect ratio of the final output file in
--aspect=ratio            width:height format (eg. -a=3:2, -a=4:5 -a=1:1). some social
                          media sites prefer specific aspect ratios for best display.

-w=your_watermark |            specifies the image-based watermark to use as the watermark that
--watermark=your_watermark     that is placed below or inside the image.

-g=placement |            specifies which inside edge or corner of the image the logo
--gravity=placement       or text should be nearest. The following are accepted values.
                          The logo or text is inset from the specified edge or corner.
                          DEFAULT edge is south/bottom.

                            +----------------------------------------------------+
                            | topleft               top                 topright |
                            |                                                    |
                            | left                 middle                  right |
                            |                                                    |
                            | bottomleft           bottom            bottomright |
                            +----------------------------------------------------+

                            +----------------------------------------------------+
                            | northwest(nw)        north           northeast(ne) |
                            |                                                    |
                            | west                 center                   east |
                            |                                                    |
                            | southwest(sw)        south           southeast(se) |
                            +----------------------------------------------------+

-l1=text/iptc item |      text or metadata field name to extract and use for line 1
--label1=text/iptc item   of a text sourced watermark

-l2=text/iptc item |      text or metadata field name to extract and use for line 2
--label2=text/iptc item   of a text sourced watermark
```

Make test copies of image files and use the shell script from the command line to experiment with how different styles decorate your test images. This will help you choose which options you want to use in your droplet(s).

You can see the names of fonts from which to choose for text-based labels using this command. In the output you will see lines beginning with "Font"

```text
% magick -list font

... lots of output
  Font: Academy-Engraved-LET-Plain:1.0
    family: Academy Engraved LET
    style: Normal
    stretch: Normal
    weight: 400
    glyphs: /System/Library/Fonts/Supplemental/Academy Engraved LET Fonts.ttf
...
```

If you want to use font "Academy Engraved LET" for a text-based watermark then you would specify it as follows on the command line.

```
frame_it -t -tf=Academy-Engraved-LET-Plain:1.0 my-image.jpg
```

Note the ` -t ` option to specify a text-based watermark.