--
-- Original: Walter Rowe in 2022
--
-- Create all the style droplets for every defined style in optionsList
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
property optionsList : {formatting:"filler"} & Â
	{logo_over_white:"-ol -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_white_drop:"-ol -d -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_white_pic:"-ol -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_white_drop_pic:"-ol -d -p -mc=#ffffff -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{formatting:"filler"} & Â
	{logo_over_gray:"-ol -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_gray_drop:"-ol -d -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_gray_pic:"-ol -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{logo_over_gray_drop_pic:"-ol -d -p -mc=#383838 -g=southeast -w=~/Pictures/watermark_white.png"} & Â
	{formatting:"filler"} & Â
	{logo_white:"-l -mc=#ffffff -w=~/Pictures/watermark_gray.png"} & Â
	{logo_white_drop:"-l -d -mc=#ffffff -w=~/Pictures/watermark_gray.png"} & Â
	{logo_white_pic:"-l -p -mc=#ffffff -w=~/Pictures/watermark_gray.png"} & Â
	{logo_white_drop_pic:"-l -d -p -mc=#ffffff -w=~/Pictures/watermark_gray.png"} & Â
	{formatting:"filler"} & Â
	{logo_gray:"-l -mc=#383838 -w=~/Pictures/watermark_white.png"} & Â
	{logo_gray_drop:"-l -d -mc=#383838 -w=~/Pictures/watermark_white.png"} & Â
	{logo_gray_pic:"-l -p -mc=#383838 -w=~/Pictures/watermark_white.png"} & Â
	{logo_gray_drop_pic:"-l -d -p -mc=#383838 -w=~/Pictures/watermark_white.png"} & Â
	{formatting:"filler"} & Â
	{text_over_white:"-ot -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_over_white_drop:"-ot -d -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_over_white_pic:"-ot -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{text_over_white_drop_pic:"-ot -d -p -mc=#ffffff -g=south -d -tc=#E0E0E0"} & Â
	{formatting:"filler"} & Â
	{text_over_gray:"-ot -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_over_gray_drop:"-ot -d -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_over_gray_pic:"-ot -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{text_over_gray_drop_pic:"-ot -d -p -mc=#383838 -g=south -d -tc=#E0E0E0"} & Â
	{formatting:"filler"} & Â
	{text_white:"-t -mc=#ffffff -tc=#383838"} & Â
	{text_white_drop:"-t -d -mc=#ffffff -tc=#383838"} & Â
	{text_white_pic:"-t -p -mc=#ffffff -tc=#383838"} & Â
	{text_white_drop_pic:"-t -d -p -mc=#ffffff -tc=#383838"} & Â
	{formatting:"filler"} & Â
	{text_gray:"-t -mc=#383838 -tc=#E0E0E0"} & Â
	{text_gray_drop:"-t -d -mc=#383838 -tc=#E0E0E0"} & Â
	{text_gray_pic:"-t -p -mc=#383838 -tc=#E0E0E0"} & Â
	{text_gray_drop_pic:"-t -d -p -mc=#383838 -tc=#E0E0E0"}

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

on run
	set filler to "formatting"
	set dropletSource to "logo_white_pic.applescript"
	
	set optionsData to my (NSDictionary's dictionaryWithDictionary:optionsList)
	set listOfDroplets to optionsData's allKeys() as list
	
	set listOfDroplets to sortList(listOfDroplets)
	
	if listOfDroplets contains filler then
		set formatting to 0
		repeat with position from 1 to count of listOfDroplets
			if item position of listOfDroplets is filler then
				set formatting to position
			end if
		end repeat
		
		if formatting is 1 then
			set listOfDroplets to items 2 thru (count of listOfDroplets) of listOfDroplets
		end if
		if formatting is (count of listOfDroplets) then
			set listOfDroplets to items 1 thru -2 of listOfDroplets
		end if
		if formatting is greater than 1 and formatting is less than (count of listOfDroplets) then
			set listOfDroplets to items 1 thru (formatting - 1) of listOfDroplets & items (formatting + 1) thru (count of listOfDroplets) of listOfDroplets
		end if
	end if
	
	-- select the droplet folder with Finder
	set dropletFolder to POSIX path of (choose folder with prompt "Select the folder for your Magick Frames droplets:")
	
	set dropletSource to the quoted form of (POSIX path of (choose file with prompt "Select the Magick Frames StyleDroplet script"))
	
	set dropletCommands to {}
	repeat with droplet in listOfDroplets
		-- set destination droplet
		set droplet to "'" & dropletFolder & droplet & ".app'"
		-- set shell command to build droplet
		set thisDroplet to "osacompile -x -o " & droplet & " " & dropletSource
		-- execute the shell command to build the droplet
		try
			do shell script thisDroplet
		on error errStr number errorNumber
			display dialog "Droplet ERROR: " & errStr & ": " & (errorNumber as text) & "on file " & this_filename
		end try
	end repeat
	
	-- join the list of droplet names on different lines
	set AppleScript's text item delimiters to "
"
	set droplets to listOfDroplets as string
	set AppleScript's text item delimiters to ""
	
	-- tell the user how many droplets were created, where they were created, and their names
	display dialog "Created " & ((count of listOfDroplets) as string) & " droplets in:

" & dropletFolder & "

" & droplets
	
	
end run