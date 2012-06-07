WordArt.cfc - version 0.6
	
	ColdFusion component by Sameer Gupta (https://github.com/samunplugged)
	
	Generates image for insertion of rich typography 
	on a webpage by converting text to image in various styles.
	
	Available under MIT license. 
	
	To download latest version visit project section 
	of https://github.com/samunplugged
		
	Syntax:
		
		wordart.getArt(<Your Message Here (string)>, <Image Options Here (struct)>);
		
	Examples:
		
		wordart.getArt("CFWheels is the future and the future is written in ColdFusion", 
				{font="LinLibertine", style="bolditalic", size=30});
		
		OR, simply pass the string:
		
		wordart.getArt("The future is written in ColdFusion");
		
	Help:
		
		The most important function of this component is getArt(). The function
		creates image using the 'text' argument and places an <img> tag in your
		document. If instead of placing <img> tag you wish to get the image URL
		then use the getArtUrl() function. getArt() and getArtUrl() both accept
		three arguments. Namely, "text", "options", and "useCache".
		
		text	-	string	- required argument
		options	-	struct
		useCache-	boolean - defaults to true
		
		
		More on getArt:
		
		The getArt() function generate an image based on your arguments.
		
		The function expects one mandatory argument and two optional arguments:
			
			1. text - a string that would be rendered in the image.
			2. options - a struct that would define how the text would appear (style, font, fontSize, fontStyle, bgColor, fgColor, wrapWidth etc).
			3. useCache - true or false. defaults to true.
		
		Detailed information for "options" argument:
		
		1.options.style: In this version there are 3 styles: 
			simple 
			stroked or twitter 
			quote or blockquote 
		2.options.font: defines the font to use. 
			This font must be available in your font directory or must be installed in your system. 
			Java default font is "serif". When the font you specified is missing, “serif” will be used. 
			Only TTF fonts are supported. OTF have limited support in Java. 
		3.options.fontStyle: string that defines the font style. Valid values are: 
			"bold" 
			"bolditalic" 
			"italic" 
			"plain". (default) 
		4.options.fontSize: a number that defines the font size. 
		5.options.wrapWidth: the max width of image you wish to create 
			defaults to 0. 
			When the value is 0, no word wrapping is done and output is single line image. 
		6.options.bgAlpha - background alpha. defaults to 0 
		7.options.fgAlpha - foreground/text alpha. defaults to 255 
		8.options.strokeAlpha - stroked alpha. defaults to 255. used when style=stroked. 
		9.options.quoteAlpha - quote alpha. defaults to 255. used when style=quote 
		10.options.shadowAlpha - shadow alpha. defaults to 125. used when shadow=true. 
			For all alpha values pass an integer that defines the opacity. 
			Valid values are from 0 to 255. 
			Number 0 = transparent 
			255 = Opaque 
		11.options.bgColor - background color. 
			defaults to FFFFFF. 
			since default alpha is 00, you will not see background color. 
		if you are not passing bgAlpha you should use 8 digit hexadecimal color code. 
		12.options.fgColor - foreground or text-color. defaults to 000000 (black) 
		13.options.strokeColor - defaults to 33CCFF 
		14.options.quoteColor - defaults to 666666 
		15.options.shadowColor - defaults to 000000 
			For all color values pass an 3digit hex OR 6digit hex, OR 8digit hex. 
			Examples: 
			1.3 digit hex: #F00 is same as #FF0000. Both equals color Red. 
			2.8 digit hex: #33FF0000. Color with alpha. Red with transparency of 20%. 
			3.First two part define transparency level. 
			4.Use 00 for complete transparent color. FF for opaque color. 
			Note: Always use # at the beginning for all color values. 
		16.options.shadow - boolean value true or false that implies drawing of shadow. 
		17.options.reflection - boolean value true or false that implies reflection effect. 
			Note: using reflection increases the height of image. 
		18.options.stickerStyle 
			Generates a trapezoid that can be placed on corner of the screen. 
			Or generates a 90 degrees rotated image for placement at 'east' or 'west' sides. 
			Valid values: 
			1."ne" rotates text for placement at north-east corner 
			2."nw" rotates text for placement at north-west corner 
			3."sw" rotates text for placement at south-west corner 
			4."se" rotates text for placement at south-east corner 
			5."west" rotates text for placement at west 
			6."east" rotates text for placement at east 
		19.options.shadowX - x coordinate offset for shadow. used for drawing shadow. 
		20.options.shadowY - y coordinate offset for shadow. used for drawing shadow. 
		21.options.reflectGap - gap between image and reflection. 
		22.options.reflectHeight – number value in fraction to define extra height added to height of generated text. 
			Defaults to 1. 
			Use this to reduce the additional empty space at the bottom of reflection. 
			Note that the reflection also includes the white space of the original image. 
		23.options.fadeHeight – number value in fraction to define height of fade. defaults to 0.4 
		24.options.reflectOpacity - opacity at the start of mirror effect. defaults to 100. valid values are 0 to 255. 
		25.options.top 
		26.options.bottom 
		27.options.left 
		28.options.right 
		29.options.cornerRadius - draws a rounded rectangle. defaults to 0.