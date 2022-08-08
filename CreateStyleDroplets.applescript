--
-- Original: Walter Rowe in 2022
--
-- Create all the style droplets for every defined style in styleDroplets
--

use AppleScript version "2.7"
use scripting additions
use framework "Foundation"

--
-- run this script to create style droplets for all of the defined styles
-- add your own styles and re-run this script to recreate all the droplets
--
-- CRITICAL -- continued lines must end with ampersand plus OPT+RETURN
--
property styleDroplets : {formatting:"filler"} & Â
	{logo_light:"-l -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & Â
	{logo_light_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & Â
	{logo_light_pic:"-l -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & Â
	{logo_light_drop_pic:"-l -d -p -mc=#ffffff -w=~/Pictures/watermark_dark.png"} & Â
	{formatting:"filler"} & Â
	{logo_light_over:"-ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_light_over_drop:"-ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_light_over_pic:"-ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_light_over_drop_pic:"-ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{formatting:"filler"} & Â
	{logo_dark:"-l -mc=#383838 -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_drop:"-l -d -mc=#383838 -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_pic:"-l -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_drop_pic:"-l -d -p -mc=#383838 -w=~/Pictures/watermark_light.png"} & Â
	{formatting:"filler"} & Â
	{logo_dark_over:"-ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_over_drop:"-ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_over_pic:"-ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{logo_dark_over_drop_pic:"-ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_light.png"} & Â
	{formatting:"filler"} & Â
	{text_light:"-t -mc=#ffffff -tc=#383838"} & Â
	{text_light_drop:"-t -d -mc=#ffffff -tc=#383838"} & Â
	{text_light_pic:"-t -p -mc=#ffffff -tc=#383838"} & Â
	{text_light_drop_pic:"-t -d -p -mc=#ffffff -tc=#383838"} & Â
	{formatting:"filler"} & Â
	{text_light_over:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_drop:"-ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_pic:"-ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_light_over_drop_pic:"-ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{formatting:"filler"} & Â
	{text_dark:"-t -mc=#383838 -tc=#E0E0E0"} & Â
	{text_dark_drop:"-t -d -mc=#383838 -tc=#E0E0E0"} & Â
	{text_dark_pic:"-t -p -mc=#383838 -tc=#E0E0E0"} & Â
	{text_dark_drop_pic:"-t -d -p -mc=#383838 -tc=#E0E0E0"} & Â
	{formatting:"filler"} & Â
	{text_dark_over:"-ot -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_drop:"-ot -d -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_pic:"-ot -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_dark_over_drop_pic:"-ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{formatting:"filler"} & Â
	{text_light_academy:"-t -mc=#ffffff -tc=#383838 -f=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_light_pic_academy:"-t -p -mc=#ffffff -tc=#383838 -f=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_dark_academy:"-t -mc=#383838 -tc=#E0E0E0 -f=Academy-Engraved-LET-Plain:1.0"} & Â
	{text_dark_pic_academy:"-t -p -mc=#383838 -tc=#E0E0E0 -f=Academy-Engraved-LET-Plain:1.0"} & Â
	{formatting:"filler"}

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

on get_styles(styleList)
	set optionsData to my (NSDictionary's dictionaryWithDictionary:styleList)
	set optionsKeys to optionsData's allKeys() as list
	return optionsKeys
end get_styles

on splitText(theText, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theTextItems to every text item of theText
	set AppleScript's text item delimiters to ""
	return theTextItems
end splitText

on run
	set filler to "formatting"
	set dropletSource to "StyleDroplet.applescript"
	
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
	set dropletSource to the quoted form of (POSIX path of dropletChoice)
	
	-- add style droplet source as a non-styled droplet
	set unStyled to dropletChoice as string
	set styleName to item -1 of splitText(unStyled, ":")
	if styleName is "" then set styleName to item -2 of splitText(unStyled, ":")
	set styleName to item 1 of splitText(styleName, ".")
	copy styleName to the end of styleNames
	
	-- set the initial progress bar information
	set dropletCount to length of styleNames
	set progress total steps to dropletCount
	set progress completed steps to 0
	set progress description to "Creating droplets..."
	set progress additional description to "Preparing to process."
	
	repeat with dropletNum from 1 to count of styleNames
		-- set destination droplet name
		set dropletName to item dropletNum of styleNames
		set droplet to "'" & dropletFolder & dropletName & ".app'"
		
		-- set shell command to create the droplet
		set createDroplet to "osacompile -x -o " & droplet & " " & dropletSource
		
		-- Update the progress detail
		set progress additional description to "Creating droplet " & dropletNum & " of " & dropletCount
		
		-- execute the shell command to build the droplet
		try
			do shell script createDroplet
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
	
end run