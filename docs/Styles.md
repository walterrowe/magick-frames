# Included Styles

The list below is the ` presetDroplets ` style list included in the CreateStyleDroplets script. It represent all of the included styles. See the command line section above for a complete description of all the options.

- The "presetDroplets" property list in CreateStyleDroplets is for included styles and should not be altered.
- The "customDroplets" property list in CreateStyleDroplets is for crafting your own styles for style droplets.
- The "{} & ¬" lines in the list are there only for readability.
- The "& ¬" characters in AppleScript are a way to join two lines together.

```applescript
property presetDroplets : {} & ¬
	{logo_transparent:"-l -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_transparent_drop:"-l -d -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_transparent_frame:"-l -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_transparent_drop_frame:"-l -d -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{} & ¬
	{logo_transparent_over:"-ol -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_transparent_over_drop:"-ol -d -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_transparent_over_frame:"-ol -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_transparent_over_drop_frame:"-ol -d -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{} & ¬
	{logo_light:"-l -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_light_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_light_frame:"-l -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_light_drop_frame:"-l -d -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_light_bevel:"-l -b -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{logo_light_picture:"-l -p -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & ¬
	{} & ¬
	{logo_light_over:"-ol -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_light_over_drop:"-ol -d -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_light_over_frame:"-ol -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_light_over_drop_frame:"-ol -d -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_light_over_bevel:"-ol -b -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_light_over_picture:"-ol -p -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{} & ¬
	{logo_dark:"-l -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_drop:"-l -d -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_frame:"-l -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_drop_frame:"-l -d -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_bevel:"-l -b -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_picture:"-l -p -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{} & ¬
	{logo_dark_over:"-ol -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_over_drop:"-ol -d -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_over_frame:"-ol -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_over_drop_frame:"-ol -d -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_over_bevel:"-ol -b -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{logo_dark_over_picture:"-ol -p -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
	{} & ¬
	{text_transparent:"-t -mc=transparent -tc=#313131"} & ¬
	{text_transparent_drop:"-t -d -mc=transparent -tc=#313131"} & ¬
	{text_transparent_frame:"-t -f -mc=transparent -tc=#313131"} & ¬
	{text_transparent_drop_frame:"-t -d -f -mc=transparent -tc=#313131"} & ¬
	{} & ¬
	{text_transparent_over:"-ot -mc=transparent -g=south -tc=#E0E0E0"} & ¬
	{text_transparent_over_drop:"-ot -d -mc=transparent -g=south -tc=#E0E0E0"} & ¬
	{text_transparent_over_frame:"-ot -f -mc=transparent -g=south -tc=#E0E0E0"} & ¬
	{text_transparent_over_drop_frame:"-ot -d -f -mc=transparent -g=south -tc=#E0E0E0"} & ¬
	{} & ¬
	{text_light:"-t -mc=#ffffff -tc=#313131"} & ¬
	{text_light_drop:"-t -d -mc=#ffffff -tc=#313131"} & ¬
	{text_light_frame:"-t -f -mc=#ffffff -tc=#313131"} & ¬
	{text_light_drop_frame:"-t -d -f -mc=#ffffff -tc=#313131"} & ¬
	{text_light_bevel:"-t -b -mc=#ffffff -tc=#333333"} & ¬
	{text_light_picture:"-t -p -mc=#ffffff -tc=#333333"} & ¬
	{} & ¬
	{text_light_over:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & ¬
	{text_light_over_drop:"-ot -d -mc=#ffffff -g=south -tc=#E0E0E0"} & ¬
	{text_light_over_frame:"-ot -f -mc=#ffffff -g=south -tc=#E0E0E0"} & ¬
	{text_light_over_drop_frame:"-ot -d -f -mc=#ffffff -g=south -tc=#E0E0E0"} & ¬
	{text_light_over_bevel:"-ot -b -mc=#ffffff -g=south -tc=#E0E0E0"} & ¬
	{text_light_over_picture:"-ot -p -mc=#ffffff -g=south -tc=#E0E0E0"} & ¬
	{} & ¬
	{text_dark:"-t -mc=#313131 -tc=#E0E0E0"} & ¬
	{text_dark_drop:"-t -d -mc=#313131 -tc=#E0E0E0"} & ¬
	{text_dark_frame:"-t -f -mc=#313131 -tc=#E0E0E0"} & ¬
	{text_dark_drop_frame:"-t -d -f -mc=#313131 -tc=#E0E0E0"} & ¬
	{text_dark_bevel:"-t -b -mc=#313131 -tc=#E0E0E0"} & ¬
	{text_dark_picture:"-t -p -mc=#313131 -tc=#E0E0E0"} & ¬
	{} & ¬
	{text_dark_over:"-ot -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{text_dark_over_drop:"-ot -d -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{text_dark_over_frame:"-ot -f -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{text_dark_over_drop_frame:"-ot -d -f -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{text_dark_over_bevel:"-ot -b -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{text_dark_over_picture:"-ot -p -mc=#313131 -g=south -tc=#E0E0E0"} & ¬
	{}
```

There is a pattern to the preset style names.

- style names with ` solid ` apply a interior pin-stripe and exterior plain solid border
- style names with ` text ` use a two-row text-based label logo for watermarking
- style names with ` logo ` use a graphic logo for watermarking (default is graphic logo)
- style names with ` over ` place the text or logo "over" (inside) the image (default is centered below)
- style names with ` drop ` use a drop-shadow vs shadow on all edges (default is all edges)
- style names with ` frame ` add a thin print-like border around images (default is no frame)
- style names with ` bevel ` add a thin beveled border around images (default is no bevel)
- style names with ` picture ` add a matte and wall frame around images (default is no wall frame)
- style names with ` light ` use a light background (matte color) (default is light matte)
- style names with ` dark ` use a dark background (matte color)
- style names with ` transparent ` use a transparent background (matte color) allowing broader use
- styles with ` -g ` use "gravity" to specify where to place your text or graphic logo (default is south)
- styles with ` watermark_light.png ` use a transparent watermark with light logo for dark backgrounds
- styles with ` watermark_dark.png ` use a transparent watermark with dark logo for light backgrounds

You must supply your own ` watermark_light.png ` and ` watermark_dark.png ` image-based watermark files.

# Create Custom Styles

If you feel comfortable with the AppleScript Script Editor, you can add your own styles to the style list. You will see entries for "formatting". These are simply fillers to make it easier to read and group together the defined styles with similar looks.

**DEFAULT**: With no options your picture is centered over a shadowbox on a light matte with your graphic logo centered below it.

> &nbsp;
> **WARNING**
>
> You MUST use Script Editor to add custom styles. The ` customDroplets ` property list uses OPT+[RETURN] to continue the list across multiple lines. Other code editing tools such as Visual Studio Code and Atom are unable to insert this special form of line continuation.
> &nbsp;

The property list uses ` key:value ` pairs where the style name is the key and the “frame\_it" options string is the value. Use “frame\_it" from the command line to test different options and develop your own custom style settings. Run “frame\_it" with NO options to see a complete list of style options. Once you have an options set you like, add a new entry to the property list with unique name and the options you choose, and export a new droplet named for your custom style(s).

```applescript
	{logo_dark_over_drop:"-ol -d -mc=#383838 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & ¬
```

When you drop files onto or double-click the ` logo_dark_over_drop ` droplet, the droplet will construct a shell command for each image file as follows:

```text
% frame_it -ol -d -mc=#383838 -g=southwest -w=~/Pictures/watermarks/watermark_light.png <your file>
```

Here are some notes for creating your own styles with the "frame\_it" script options.

- The wall picture frame ("-p") and bevel ("-b") looks disable shadowboxing and thin inner frame.
- The wall picture frame ("-p") look always includes a bevel between the picture and the matte.
- Using "frame\_it" from the command line will accelerate developing your own custom styles.
- The [HTML Color Codes](https://htmlcolorcodes.com/color-picker/) page is great for picking colors for bevel, frame, matte, shadow, wall frame, and text.

The gravity ("-g") option offers great flexibility in placing your logo along the top, middle, or bottom. It uses compass direction terms to specify the location.

- Across the Top: ` -g=northwest ` OR ` -g=north ` OR ` -g=northeast `
- Across the Middle: ` -g=west ` OR ` -g=center ` OR ` -g=east `
- Across the Bottom: ` -g=southwest ` OR ` -g=south ` OR ` -g=southeast `

Here are some useful tips for using gravity to place your logo.

- With text ("-t") and logo ("-l") styles you can use the gravity ("-g") option to place the logo above or below the picture.
    - Centered Above or Below: ` -g=north ` OR ` -g=south `
    - Any Corner Above/Below: ` -g=northwest ` OR  `-g=northeast ` OR ` -g=southwest ` OR  ` -g=southeast `
- With the overlay styles ("-ol" and "-ot") you can use the gravity ("-g") option to place the logo anywhere on the picture.
    - Across the Top: ` -g=northwest ` OR ` -g=north ` OR ` -g=northeast `
    - Across the Middle: ` -g=west ` OR ` -g=center ` OR ` -g=east `
    - Across the Bottom: ` -g=southwest ` OR ` -g=south ` OR ` -g=southeast `

There are two style lists in CreateStyleDroplets.

The ` customDroplets ` style list is formatted the same as the ` presetDroplets ` style list and appears directly below it in the CreateStyleDroplets script.

Carefully follow the instructions inside the CreateStyleDroplets script when adding or modifying style definitions. Any formatting errors will prevent the script from running properly.

- Use "The Easy Way" instructions to recreate all the style droplets including your own custom styles.
- Use "The Hard Way" instructions to create style droplets of only your custom styles.

Regardless of how you create them, your custom style droplets behave the same as the included styles droplets.
