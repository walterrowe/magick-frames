(*

  Original: Walter Rowe in 2022

  The droplets created from this AppleScript work like any other macOS app. You
  can drag-n-drop onto them in Finder,  double-click them to choose files to decorate,
  and as a named app in an export configuration in image editing tools.

  Modifying The Styles List:
  * Look below for the property "styleDroplets" to create your own styles for droplets
  * Read the frame_it shell script to see the options available for styling your images
  * The included styles create NEW files with "-" and the style name inserted before
   the extension.
      * example: my-image.jpg -> my-image-logo_light.jpg

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

-- save this script as an app named one of the items below (ig "logo_white_frame") it will use the selected options for frame_it
--
-- you can add your own styles names and options, and save as a new app named for your style to use your chosen options
--
-- CRITICAL -- continued lines must end with ampersand plus OPT+RETURN

property presetDroplets : {} & Â
	{logo_transparent:"-l -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_transparent_drop:"-l -d -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_transparent_frame:"-l -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_transparent_drop_frame:"-l -d -f -mc=transparent -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{} & Â
	{logo_transparent_over:"-ol -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_transparent_over_drop:"-ol -d -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_transparent_over_frame:"-ol -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_transparent_over_drop_frame:"-ol -d -f -mc=transparent -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{} & Â
	{logo_light:"-l -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_light_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_light_frame:"-l -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_light_drop_frame:"-l -d -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_light_bevel:"-l -b -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_light_picture:"-l -p -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{} & Â
	{logo_light_over:"-ol -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_light_over_drop:"-ol -d -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_light_over_frame:"-ol -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_light_over_drop_frame:"-ol -d -f -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_light_over_bevel:"-ol -b -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_light_over_picture:"-ol -p -mc=#ffffff -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{} & Â
	{logo_dark:"-l -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_drop:"-l -d -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_frame:"-l -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_drop_frame:"-l -d -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_bevel:"-l -b -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_picture:"-l -p -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{} & Â
	{logo_dark_over:"-ol -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_over_drop:"-ol -d -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_over_frame:"-ol -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_over_drop_frame:"-ol -d -f -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_over_bevel:"-ol -b -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_dark_over_picture:"-ol -p -mc=#313131 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{} & Â
	{text_transparent:"-t -mc=transparent -tc=#313131"} & Â
	{text_transparent_drop:"-t -d -mc=transparent -tc=#313131"} & Â
	{text_transparent_frame:"-t -f -mc=transparent -tc=#313131"} & Â
	{text_transparent_drop_frame:"-t -d -f -mc=transparent -tc=#313131"} & Â
	{} & Â
	{text_transparent_over:"-ot -mc=transparent -g=south -d -tc=#E0E0E0"} & Â
	{text_transparent_over_drop:"-ot -d -mc=transparent -g=south -d -tc=#E0E0E0"} & Â
	{text_transparent_over_frame:"-ot -f -mc=transparent -g=south -d -tc=#E0E0E0"} & Â
	{text_transparent_over_drop_frame:"-ot -d -f -mc=transparent -g=south -d -tc=#E0E0E0"} & Â
	{} & Â
	{text_light:"-t -mc=#ffffff -tc=#313131"} & Â
	{text_light_drop:"-t -d -mc=#ffffff -tc=#313131"} & Â
	{text_light_frame:"-t -f -mc=#ffffff -tc=#313131"} & Â
	{text_light_drop_frame:"-t -d -f -mc=#ffffff -tc=#313131"} & Â
	{text_light_bevel:"-t -b -mc=#ffffff -tc=#333333"} & Â
	{text_light_picture:"-t -p -mc=#ffffff -tc=#333333"} & Â
	{} & Â
	{text_light_over:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_drop:"-ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_frame:"-ot -f -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_drop_frame:"-ot -d -f -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_bevel:"-ot -b -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_picture:"-ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{} & Â
	{text_dark:"-t -mc=#313131 -tc=#E0E0E0"} & Â
	{text_dark_drop:"-t -d -mc=#313131 -tc=#E0E0E0"} & Â
	{text_dark_frame:"-t -f -mc=#313131 -tc=#E0E0E0"} & Â
	{text_dark_drop_frame:"-t -d -f -mc=#313131 -tc=#E0E0E0"} & Â
	{text_dark_bevel:"-t -b -mc=#313131 -tc=#E0E0E0"} & Â
	{text_dark_picture:"-t -p -mc=#313131 -tc=#E0E0E0"} & Â
	{} & Â
	{text_dark_over:"-ot -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_drop:"-ot -d -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_frame:"-ot -f -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_drop_frame:"-ot -d -f -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_bevel:"-ot -b -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_picture:"-ot -p -mc=#313131 -g=south -d -tc=#E0E0E0"} & Â
	{}

property colorDroplets : {} & Â
	{logo_green_drop_frame:"-l -d -f -mc=#106043 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_green_picture:"-l -p -mc=#106043 -bc=#106043 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_green_picture_on_sw:"-ol -p -mc=#106043 -bc=#106043 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_green_frame_on_sw:"-ol -f -mc=#106043 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_mauve_frame_north:"-f -fc=#958898 -mc=#453848 -l -g=north -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_mauve_frame_south:"-f -fc=#958898 -mc=#453848 -l -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_mauve_picture_south:"-p -bc=#958898 -mc=#453848 -l -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_mauve_frame_south:"-f -fc=#958898 -mc=#453848 -t -tc=#958898 -g=south"} & Â
	{text_mauve_picture_south:"-p -bc=#958898 -mc=#453848 -t -tc=#958898 -g=south"} & Â
	{logo_teal_picture_on_sw:"-p -ol -bc=#17342E -mc=#17342E -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_teal_picture_below:"-p -l -bc=#17342E -mc=#17342E -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_teal_frame_on_sw:"-f -ol -bc=#17342E -mc=#17342E -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_teal_frame_below:"-f -l -bc=#17342E -mc=#17342E -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_on_sw:"-ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_below:"-l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_frame_on_sw:"-f -ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_frame_below:"-f -l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_picture_on_sw:"-p -ol -bc=#A1815B -mc=#A1815B -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_khaki_picture_below:"-p -l -bc=#A1815B -mc=#A1815B -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_pink_on_sw:"-ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_pink_below:"-l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_pink_frame_on_sw:"-f -ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_pink_frame_below:"-f -l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_pink_picture_on_sw:"-p -ol -bc=#FBE7EC -mc=#FBE7EC -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_pink_picture_below:"-p -l -bc=#FBE7EC -mc=#FBE7EC -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_blue_on_sw:"-ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_blue_below:"-l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_blue_frame_on_sw:"-f -ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_blue_frame_below:"-f -l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_blue_picture_on_sw:"-p -ol -bc=#7194AE -mc=#DCEDF7 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_blue_picture_below:"-p -l -bc=#7194AE -mc=#DCEDF7 -g=south -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{logo_slate_on_sw:"-ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_slate_below:"-l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_slate_frame_on_sw:"-f -ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_slate_frame_below:"-f -l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_slate_picture_on_sw:"-p -ol -bc=#4C6578 -mc=#34546A -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_slate_picture_below:"-p -l -bc=#4C6578 -mc=#34546A -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_picture_below:"-p -l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_picture_on_sw:"-p -ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_frame_on_sw:"-f -ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_frame_below:"-f -l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_below:"-l -mc=#583C2D -bc=#6D5447 -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_chestnut_on_sw:"-ol -mc=#583C2D -bc=#6D5447 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_goldenrod_picture_on_sw:"-p -ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_goldenrod_frame_on_sw:"-f -ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_goldenrod_frame_below:"-f -l -bc=#EDD290 -mc=#DAA520 -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_goldenrod_on_sw:"-ol -bc=#EDD290 -mc=#DAA520 -g=southwest -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{logo_goldenrod_below:"-l -bc=#EDD290 -mc=#DAA520 -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_seashell_picture_on_south:"-p -ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_seashell_frame_on_south:"-f -ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_seashell_frame_below:"-f -t -tc=#807A77 -mc=#FFF5EE -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_seashell_on_south:"-ot -tc=#FFE5F3 -bc=#BFB8B3 -mc=#FFF5EE -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{text_seashell_below:"-t -tc=#807A77-mc=#FFF5EE -g=south -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{}

property customDroplets : {} & Â
	{light_matte_dark_logo:"-l -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{dark_matte_light_logo:"-l -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{light_matte_light_logo_over:"-ol -g=southwest -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{light_matte_dark_logo_over:"-ol -g=southwest -f -mc=#ffffff -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{dark_matte_light_logo_over:"-ol -g=southwest -f -mc=#313131 -w=~/Pictures/watermarks/watermark_light.png"} & Â
	{dark_matte_dark_logo_over:"-ol -g=southwest -f -mc=#313131 -w=~/Pictures/watermarks/watermark_dark.png"} & Â
	{} & Â
	{text_light_academy:"-t -mc=#ffffff -tc=#313131 -tf=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_light_frame_academy:"-t -f -mc=#ffffff -tc=#313131 -tf=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_dark_academy:"-t -mc=#313131 -tc=#E0E0E0 -tf=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_dark_frame_academy:"-t -f -mc=#313131 -tc=#E0E0E0 -tf=Academy-Engraved-LET-Plain:1.0"} & Â
	{}

property styleDroplets : presetDroplets & colorDroplets & customDroplets


-- get the list of style names
on get_styles(styleList)
	set optionsData to my (NSDictionary's dictionaryWithDictionary:styleList)
	set optionsKeys to optionsData's allKeys() as list
	return optionsKeys
end get_styles

-- get the options for a specific style
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

-- split a string based on a specific delimiter
on joinText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText as string
	set AppleScript's text item delimiters to ""
	return theTextItems
end joinText

-- split a string based on a specific delimiter
on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

-- sort a list
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

-- "on run" executes when you double-click a droplet in Finder
on run
	set filler to "formatting"
	set createStyleDroplets to "CreateStyleDroplets"
	
	-- convert "path:to:me.app:" into "me" (apps are folders so note the trailing colon thus the -2 below)
	set appPath to path to me as string
	set appName to item -1 of splitText(appPath, ":")
	if appName is "" then set appName to item -2 of splitText(appPath, ":")
	set appBase to item 1 of splitText(appName, ".")
	
	-- if we are running as the name "CreateStyleDroplets", create a droplet for all the known styles
	if appBase is createStyleDroplets then
		createDroplets()
	else
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
		
		set styleList to {} as list
		if styleNames contains appBase then
			-- if run as a style-named droplet, use that style name
			set styleList to appBase as list
		else
			-- if run from Script Editor, choose from list of known styles
			set styleList to choose from list styleNames with multiple selections allowed
		end if
		
		-- styleList will be false if 'Cancel' pressed on choose from list
		if styleList is not false then
			-- styleList will be false if 'Cancel' pressed on choose from list
			set selected_items to choose file with prompt "Select the images to decorate:" of type {"public.image"} with multiple selections allowed
			
			repeat with styleName in styleList
				-- get desired frame_it options based on invoked app name
				set frame_it_options to get_options(styleName)
				process_items(selected_items, frame_it_options, styleName)
			end repeat
		end if
	end if
end run

-- "on open" processes items dropped onto it in Finder or sent to it via "open app with parameters"
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
	
	-- styleList will be false if 'Cancel' pressed on choose from list
	if styleList is not false then
		repeat with styleName in styleList
			-- get desired frame_it options based on invoked app name
			set frame_it_options to get_options(styleName)
			process_items(dropped_items, frame_it_options, styleName)
		end repeat
	end if
end open

-- create the frame_it commands and execute them
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

-- create the style droplets
on createDroplets()
	set filler to "formatting"
	set unStyledDroplet to "StyleChooser"
	
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
	
	-- select the droplet folder and droplet script with Finder 
	set dropletFolder to POSIX path of (choose folder with prompt "Select the folder for your Magick Frames droplets:")
	set dropletChoice to choose file with prompt "Select the Magick Frames StyleDroplet script" default location POSIX path of (path to me)
	set dropletSource to the POSIX path of dropletChoice
	
	set iconSource to splitText(dropletSource, "/") as list
	set iconSource to items 1 thru -2 of iconSource
	set iconSource to joinText(iconSource, "/") & "/droplet.icns"
	
	-- add unstyled droplet to list of droplet names
	copy unStyledDroplet to the end of styleNames
	
	-- set the initial progress bar information
	set dropletCount to length of styleNames
	set progress total steps to dropletCount
	set progress completed steps to 0
	set progress description to "Creating droplets..."
	set progress additional description to "Preparing to process."
	
	repeat with dropletNum from 1 to count of styleNames
		-- set destination droplet name
		set dropletName to item dropletNum of styleNames
		set droplet to dropletFolder & dropletName & ".app"
		
		set iconTarget to droplet & "/Contents/Resources/"
		
		-- set shell command to create the droplet
		set createDroplet to "osacompile -x -o " & quoted form of droplet & " " & quoted form of dropletSource
		set copyIcon to "/bin/cp " & quoted form of iconSource & " " & quoted form of iconTarget
		
		-- Update the progress detail
		set progress additional description to "Creating droplet " & dropletNum & " of " & dropletCount
		
		-- execute the shell command to build the droplet
		try
			do shell script createDroplet
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & droplet
		end try
		
		-- execute the shell command to build the droplet
		try
			do shell script copyIcon
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & droplet
		end try
		
		-- Increment the progress
		set progress completed steps to dropletNum
		
	end repeat
	display dialog "Created " & ((count of styleNames) as string) & " droplets in:

" & dropletFolder
	
	-- tell the user how many droplets were created, where they were created, and their names
	do shell script "open " & ("'" & dropletFolder & "'")
	
end createDroplets