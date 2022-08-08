(*

  Original: Walter Rowe in 2022

  The droplet you create from this AppleScript can be used via drag-n-drop in Finder, as a
  double-clicked app to choose files to decorate, and as a named app in an export
  configuration in image editing tools.

  Modifying The Styles List:
  * Look below for the property "styleDroplets" to create additional styles for droplets
  * Read the frame_it shell script to see the options available for styling your images
  * The included styles create NEW files with "-frame" inserted before extension
    * example: my-image.jpg -> my-image-frame.jpg

  Use the CreateStyleDroplets script to create droplets for all the included styles.

  See the README.md markdown file for detailed instructions on installation and use

*)

use AppleScript version "2.7"
use scripting additions
use framework "Foundation"

(* TO FILTER FOR IMAGE FILES, LOOK FOR QUICKTIME SUPPORTED IMAGE FORMATS *)
property type_list : {"JPEG", "TIFF", "PNGf", "8BPS", "BMPf", "GIFf"}
property extension_list : {"jpg", "jpeg", "tif", "tiff", "png", "psd", "bmp", "gif"}
property typeIDs_list : {"public.jpeg", "public.tiff", "public.png", "com.adobe.photoshop-image", "com.microsoft.bmp", "com.compuserve.gif", "com.adobe.pdf", "com.apple.pict"}


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

--
-- save this script as an app named one of the items below (ig "logo_white_pic") it will use the selected options for frame_it
--
-- you can add your own app names and options, and save as your new app name to use your chosen options
--
-- CRITICAL -- continued lines must end with ampersand plus OPT+RETURN
--
property styleDroplets : {formatting:"filler"} & �
	{logo_light:"-l -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & �
	{logo_light_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & �
	{logo_light_pic:"-l -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & �
	{logo_light_drop_pic:"-l -d -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & �
	{formatting:"filler"} & �
	{logo_light_over:"-ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_light_over_drop:"-ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_light_over_pic:"-ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_light_over_drop_pic:"-ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{formatting:"filler"} & �
	{logo_dark:"-l -mc=#383838 -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_drop:"-l -d -mc=#383838 -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_pic:"-l -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_drop_pic:"-l -d -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & �
	{formatting:"filler"} & �
	{logo_dark_over:"-ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_over_drop:"-ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_over_pic:"-ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{logo_dark_over_drop_pic:"-ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & �
	{formatting:"filler"} & �
	{text_light:"-t -mc=#ffffff -tc=#383838"} & �
	{text_light_drop:"-t -d -mc=#ffffff -tc=#383838"} & �
	{text_light_pic:"-t -p -mc=#ffffff -tc=#383838"} & �
	{text_light_drop_pic:"-t -d -p -mc=#ffffff -tc=#383838"} & �
	{formatting:"filler"} & �
	{text_light_over:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & �
	{text_light_over_drop:"-ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0"} & �
	{text_light_over_pic:"-ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & �
	{text_light_over_drop_pic:"-ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & �
	{formatting:"filler"} & �
	{text_dark:"-t -mc=#383838 -tc=#E0E0E0"} & �
	{text_dark_drop:"-t -d -mc=#383838 -tc=#E0E0E0"} & �
	{text_dark_pic:"-t -p -mc=#383838 -tc=#E0E0E0"} & �
	{text_dark_drop_pic:"-t -d -p -mc=#383838 -tc=#E0E0E0"} & �
	{formatting:"filler"} & �
	{text_dark_over:"-ot -mc=#383838 -g=south -d -tc=#E0E0E0"} & �
	{text_dark_over_drop:"-ot -d -mc=#383838 -g=south -d -tc=#E0E0E0"} & �
	{text_dark_over_pic:"-ot -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & �
	{text_dark_over_drop_pic:"-ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & �
	{formatting:"filler"}

on get_styles(styleList)
	set optionsData to my (NSDictionary's dictionaryWithDictionary:styleList)
	set optionsKeys to optionsData's allKeys() as list
	return optionsKeys
end get_styles

on get_options(appName)
	set optionsData to my (NSDictionary's dictionaryWithDictionary:styleDroplets)
	set optionsKeys to optionsData's allKeys() as list
	if optionsKeys contains appName then
		set appOptions to optionsData's valueForKey:(appName as text)
	else
		set appOptions to false
	end if
	return appOptions
end get_options

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

on sortList(theList)
	set theIndexList to {}
	set theSortedList to {}
	repeat (length of theList) times
		set theLowItem to ""
		repeat with a from 1 to (length of theList)
			if a is not in theIndexList then
				set theCurrentItem to item a of theList as text
				if theLowItem is "" then
					set theLowItem to theCurrentItem
					set theLowItemIndex to a
				else if theCurrentItem comes before theLowItem then
					set theLowItem to theCurrentItem
					set theLowItemIndex to a
				end if
			end if
		end repeat
		set end of theSortedList to theLowItem
		set end of theIndexList to theLowItemIndex
	end repeat
	return theSortedList
end sortList

-- on run event executes when the user double-clicks the app in Finder
on run
	set filler to "formatting"
	
	-- convert "path:to:me.app:" into "me" (apps are folders so note the trailing colon thus the -2 below)
	set appPath to path to me as string
	set appName to item -1 of splitText(appPath, ":")
	if appName is "" then set appName to item -2 of splitText(appPath, ":")
	set appBase to item 1 of splitText(appName, ".")
	
	-- either run a style-named droplet or choose from list of styles
	set styleNames to get_styles(styleDroplets)
	set styleNames to sortList(styleNames)
	
	if styleNames contains filler then
		set formatting to 0
		repeat with position from 1 to count of styleNames
			if item position of styleNames is filler then
				set formatting to position
			end if
		end repeat
		
		if formatting is 1 then
			set styleNames to items 2 thru (count of styleNames) of styleNames
		end if
		if formatting is (count of styleNames) then
			set styleNames to items 1 thru -2 of styleNames
		end if
		if formatting is greater than 1 and formatting is less than (count of styleNames) then
			set styleNames to items 1 thru (formatting - 1) of styleNames & items (formatting + 1) thru (count of styleNames) of styleNames
		end if
	end if
	
	if styleNames contains appBase then
		-- if run as a style-named droplet, use that style name
		set styleList to appBase as list
	else
		-- if run from Script Editor, choose from list of known styles
		set styleList to choose from list styleNames with multiple selections allowed
	end if
	
	-- app was run from Finder via double-click so pop up file chooser
	set selected_items to choose file with prompt "Select the images to decorate:" of type {"public.image"} with multiple selections allowed
	
	repeat with styleName in styleList
		-- get desired frame_it options based on invoked app name
		set frame_it_options to get_options(styleName)
		process_items(selected_items, frame_it_options, styleName)
	end repeat
end run

-- on open event processes items dropped onto it or sent to it via open app with parameters
on open dropped_items
	set filler to "formatting"
	
	-- convert "path:to:me.app:" into "me" (note the trailing colon this -2 below)
	set appPath to path to me as string
	set appName to item -1 of splitText(appPath, ":")
	if appName is "" then set appName to item -2 of splitText(appPath, ":")
	set appBase to item 1 of splitText(appName, ".")
	
	-- either run a style-named droplet or choose from list of styles
	set styleNames to get_styles(styleDroplets)
	set styleNames to sortList(styleNames)
	
	if styleNames contains filler then
		set formatting to 0
		repeat with position from 1 to count of styleNames
			if item position of styleNames is filler then
				set formatting to position
			end if
		end repeat
		
		if formatting is 1 then
			set styleNames to items 2 thru (count of styleNames) of styleNames
		end if
		if formatting is (count of styleNames) then
			set styleNames to items 1 thru -2 of styleNames
		end if
		if formatting is greater than 1 and formatting is less than (count of styleNames) then
			set styleNames to items 1 thru (formatting - 1) of styleNames & items (formatting + 1) thru (count of styleNames) of styleNames
		end if
	end if
	
	if styleNames contains appBase then
		-- if run as a style-named droplet, use that style name
		set styleList to appBase as list
	else
		-- if run from Script Editor, choose from list of known styles
		set styleList to choose from list styleNames with multiple selections allowed
	end if
	
	repeat with styleName in styleList
		-- get desired frame_it options based on invoked app name
		set frame_it_options to get_options(styleName)
		process_items(dropped_items, frame_it_options, styleName)
	end repeat
end open

on process_items(the_items, frame_it_options, styleName)
	
	repeat with this_item in the_items
		
		set item_info to info for this_item
		
		-- get the name of the current file we are processing
		try
			set this_filename to name of item_info
		on error
			set this_filename to ""
		end try
		
		-- get the extension of the current file we are processing
		try
			set this_extension to name extension of item_info
		on error
			set this_extension to ""
		end try
		
		-- get the type of the current file we are processing
		try
			set this_filetype to file type of item_info
		on error
			set this_filetype to ""
		end try
		
		-- get the type ID of the current file we are processing
		try
			set this_typeID to type identifier of item_info
		on error
			set this_typeID to ""
		end try
		
		-- only process if we support the image type
		if ((this_filetype is in type_list) or (this_extension is in extension_list) or (this_typeID is in typeIDs_list)) then
			
			-- get the POSIX path of the current file we are processing
			set this_path to quoted form of POSIX path of this_item
			
			-- build the frame_it command line
			set frame_it to "eval $(/usr/libexec/path_helper -s); frame_it " & frame_it_options & " -s=" & styleName & " " & this_path
			
			-- run frame_it on the named file
			try
				do shell script frame_it
			on error errStr number errorNumber
				display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & this_filename
			end try
			
		end if
	end repeat
end process_items
