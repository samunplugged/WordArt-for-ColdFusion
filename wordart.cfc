<!---
	This file is part of WordArt CFC, written by Sameer Gupta.
	
	WordArt.cfc - free and open soure code available under the BSD License.
	
	Copyright (c) 2009-2012, Sameer Gupta (sameer@codecurry.com).
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:
	    * Redistributions of source code must retain the above copyright
	      notice, this list of conditions and the following disclaimer.
	    * Redistributions in binary form must reproduce the above copyright
	      notice, this list of conditions and the following disclaimer in the
	      documentation and/or other materials provided with the distribution.
	    * Neither the name of the developer (Sameer Gupta) nor the
	      names of its contributors may be used to endorse or promote products
	      derived from this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY SAMEER GUPTA ''AS IS'' AND ANY
	EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL SAMEER GUPTA BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
--->

<cfcomponent 
	hint="Generates image for insertion of rich typography on a webpage by converting text to image in various styles."
	mixin="controller">
<!---
	WordArt.cfc
	
	ColdFusion component by Sameer Gupta (http://www.codecurry.com/)
	
	Generates image for insertion of rich typography 
	on a webpage by converting text to image in various styles.
	
	Available under MIT license. 
	
	To download latest version visit project section 
	of https://github.com/samunplugged/WordArt-for-ColdFusion
		
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
	--->
<cfproperty name="artUrlPath" default="" >
<cfproperty name="artDirectory" default="" >
<cfproperty name="fontDirectory" default="" >
<cffunction name="init" access="public">
	<cfargument name="urlPath" type="String" default="/images/wordart/" hint="path with which stored images can be accessed from browser" />
	<cfargument name="artDir" type="String" default="#expandPath("images/wordart/")#" hint="absolute path of directory where generated images are to be stored" />
	<cfargument name="fontDir" type="String" default="#expandPath("files/fonts/")#" hint="absolute path of directory where you store fonts. this directory is checked for fonts before system's font directory is checked. when a font is missing from both the folders, 'serif' font is used." />
	<cfset this.version = "0.9,1.0" /> <!--- supported cfwheels version --->
	<cfset this.setArtUrlPath(urlPath) />
	<cfset this.setArtDirectory(artDir) />
	<cfset this.setFontDirectory(fontDir) />
	<cfreturn this />
</cffunction>
<cffunction name="getArt" returntype="void" access="public">
	<cfargument name="text" type="String" required="true" />
	<cfargument name="options" type="Struct" default="#StructNew()#" required="false" />
	<cfargument name="useCache" type="Boolean" default="true" required="false" />
	<cfset var local = structNew() />
	<cfscript>
		local.img = getArtUrl(text, options, useCache);
		if (local.img eq "") {
			return;
		}
	</cfscript>
	<cfoutput> <img src="#local.img#" alt="#htmlEditFormat(text)#" title="#htmlEditFormat(text)#" /> </cfoutput>
</cffunction>
<cffunction name="getArtUrl" returntype="string" access="public">
	<cfargument name="text" type="String" required="true" />
	<cfargument name="options" type="Struct" default="#StructNew()#" required="false" />
	<cfargument name="useCache" type="Boolean" default="true" required="false" />
	<cfset var local = structNew() />
	<cfset options.pluginVersion = "0.0.1" />
	<cfscript>
		local.checksum = $getChecksum(text & serializeJSON(options));
		if (useCache eq true) {
			local.imagePath = getArtDirectory()  & local.checksum & ".png";
			if (fileExists(local.imagePath)) {
				return getArtUrlPath() & local.checksum & ".png";
			}
		}
		
		local.imagePath = $createArt(text, options);
		
		if (fileExists(local.imagePath)) {
			return getArtUrlPath() & local.checksum & ".png";
		} else {
			return "";
		}
	</cfscript>
</cffunction>
<cffunction name="setArtUrlPath" returntype="void" access="public">
	<cfargument name="path" type="String" required="true" hint="URL path that is used in <img> tags. The path will be prefixed to filename of genarated images." />
	<cfif right(path, 1) neq "/">
		<cfset path = path & "/" />
	</cfif>
	<cfif isDefined("application.wheels.plugins.wordart")>
		<!--- 
		in cfwheels this.urlPath cannot be used in plugins:
		http://groups.google.com/group/cfwheels/browse_thread/thread/4f200dfa73e56d30/dba3b34da1ad2f2c
		--->
		<cfset application.wheels.plugins.wordart.urlPath = path />
	<cfelse>
		<cfset this.urlPath = path />
	</cfif>
</cffunction>
<cffunction name="getArtUrlPath" returntype="String" access="public">
	<cfif isDefined("application.wheels.plugins.wordart")>
		<!--- 
		in cfwheels this.urlPath cannot be used in plugins
		--->
		<cfreturn application.wheels.plugins.wordart.urlPath />
	<cfelse>
		<cfreturn this.urlPath />
	</cfif>
</cffunction>
<cffunction name="setArtDirectory" returntype="void" access="public">
	<cfargument name="path" type="String" required="true" hint="Use absolute paths only" />
	<cfset var separator = createObject("java", "java.lang.System").getProperty("file.separator") />
	<cfif right(path, 1) neq separator>
		<cfset path = path & separator />
	</cfif>
	<cfif isDefined("application.wheels.plugins.wordart")>
		<cfset application.wheels.plugins.wordart.artDirectory = path />
	<cfelse>
		<cfset this.artDirectory = path />
	</cfif>
	<cfif directoryExists(path) eq false>
		<cfset directoryCreate8(path) />
	</cfif>
</cffunction>
<cffunction name="getArtDirectory" returntype="String" access="public">
	<cfif isDefined("application.wheels.plugins.wordart")>
		<cfreturn application.wheels.plugins.wordart.artDirectory />
	<cfelse>
		<cfreturn this.artDirectory />
	</cfif>
</cffunction>
<cffunction name="setFontDirectory" returntype="void">
	<cfargument name="path" type="String" required="true" hint="Use absolute paths only" />
	<cfset var separator = createObject("java", "java.lang.System").getProperty("file.separator") />
	<cfif right(path, 1) neq separator>
		<cfset path = path & separator />
	</cfif>
	<cfif isDefined("application.wheels.plugins.wordart")>
		<cfset application.wheels.plugins.wordart.fontDirectory = path />
	<cfelse>
		<cfset this.fontDirectory = path />
	</cfif>
	<!--- we are using expand path to create platform specific path --->
	<cfif directoryExists(path) eq false>
		<cfset directoryCreate8(path) />
	</cfif>
</cffunction>
<cffunction name="getFontDirectory" returntype="Any">
	<cfif isDefined("application.wheels.plugins.wordart")>
		<cfreturn application.wheels.plugins.wordart.fontDirectory />
	<cfelse>
		<cfreturn this.fontDirectory />
	</cfif>
</cffunction>
<cffunction name="removeArt" returntype="boolean" access="public">
	<cfargument name="text" type="String" required="true" />
	<cfargument name="options" type="Struct" default="#StructNew()#" required="false" />
	<cfset var local = structNew() />
	<cfscript>
		/*
		* plugin version here helps us in refreshing caches when plugin is 
		* updated in a way that effect image output
		* this is not the actual plugin version
		*/
		options.pluginVersion = "0.0.1";
		local.checksum = $getChecksum(text & serializeJSON(options));
		local.imagePath = getArtDirectory()  & local.checksum & ".png";
		if (fileExists(local.imagePath)) {
			try {
				fileDelete(local.imagePath);
				return true;
			} catch (any Ex) {
				// file is locked or cannot be deleted
				return false;
			}
		}
		return false;
	</cfscript>
</cffunction>
<cffunction name="removeAllArt" returntype="boolean" access="public">
	<cfscript>
		var images = directoryList(getArtDirectory(), false, "path", "*.png");
		var i = arrayLen(images);
		while (i--) {
			try {
				fileDelete(images[i]);
			} catch (any e) {
				return false;
			}
		}
		return true;
	</cfscript>
</cffunction>
<cffunction name="$createArt" returntype="String" access="public">
	<cfargument name="text" type="String" required="true">
	<cfargument name="options" type="Struct" default="#StructNew()#" required="false">
	<cfset var v = "" />
	<cfset var local = structNew() />
	<cfset var defaults = structNew() />
	<cfset var values = structNew() />
	<!--- we use image variable only for calculating dimension and creating layouts with it buffered image --->
	<cfset var image = imageNew("", 1, 1, "argb") />
	<!--- we store the path to final image in the variable --->
	<cfset var imagePath = "" />
	<!--- plugin version here helps us in refreshing caches when plugin is updated in a way that effect image output
	this is not the actual plugin version --->
	<cfset options.pluginVersion = "0.0.1" />
	<cfscript>
		// make sure text is passed and is not an empty string:
		if (trim(text) eq "") {
			return false;
		}
		// handle user options and mix with default values:
		// default values
		defaults = {
			style = "simple"			// valid values are "simple", "quote" and "stroked"
			,font = "serif"				// TTF font name without extension. font file is checked in site's font folder first. then system's font folder is used. if font is not found in either location then "serif" is used.
			,fontSize = 12		 		// any integer is valid
			,fontStyle = "plain" 		// valid values: "plain", "italic", "bold", "bolditalic"
			,wrapWidth = 0				// 0 will create image in a single line
			,bgColor = "##FFFFFF" 		// you can pass 3digit hex, 6digit hex, or 8digit hex
			,bgAlpha = 0				// alpha values from 0 to 255 - 0 is transparent, and 255 is opaque
			,fgColor = "##000000" 		// you can pass 3digit hex, 6digit hex, or 8digit hex
			,fgAlpha = 255				// alpha values from 0 to 255 - 0 is transparent, and 255 is opaque
			,strokeColor = "##33CCFF"		
			,strokeAlpha = 255			
			,quoteColor = "##666666"		
			,quoteAlpha = 128			
			,quoteChar = chr(147)
			,shadowColor = "##000000"		
			,shadowAlpha = 125			// remember value 100 doesn't mean opaque. 255 is opaque and 0 is transparent. alpha values are from 0 to 255.
			,shadow = false				// false implies no shadow effect. true implies shadow effect.
			,shadowX = "1"				// x coordinate position offset of shadow
			,shadowY = "1"				// y coordinate position offset of shadow
			,reflection = false			// false implies no reflection effect. true implies a reflection effect.
			,reflectGap = 0				// an integer value that defines the gap between text and mirror
			,reflectHeight = 1			// defines additional image height for reflect effect in fraction of original height of generated text. 
			,fadeHeight = 0.4			// defines fade height of effect in fraction of original height of generated text. 
			,reflectOpacity = 100		// defines the opacity at the start of mirror effect 
			,stickerStyle = ""			// valid values are "ne", "nw", "sw", "se", "east", "west" - it implies sticker placement.
			,top = 0					// top padding
			,bottom = 0					// bottom padding
			,left = 0					// left padding
			,right = 0					// right padding
			,cornerRadius = 0
		};
		
		// user passed options are stored in 'values' struct:
		values  = duplicate(options);
		for (v in defaults) {
			if (structKeyExists(options, v) eq true AND isSimpleValue(options[v]) eq true AND trim(options[v]) neq ""
				AND isNumeric(options[v]) eq isNumeric(defaults[v])
				AND isBoolean(options[v]) eq isBoolean(defaults[v]) ) {
				values[v] = options[v];
			} else {
				values[v] = defaults[v];
			}
		}
		
		if (values.wrapWidth lt 0) {
			values.wrapWidth = 0;
		}
		
		// handle the color value passed for fore-ground
		values.fgColor = $stringToHexColor(values.fgColor);
		if (values.fgColor.alpha neq "") {
			values.fgAlpha = values.fgColor.alpha;
		} else {
			values.fgAlpha = inputBaseN(values.fgAlpha, 10);
		}
		
		// handle the color value passed for back-ground
		values.bgColor = $stringToHexColor(values.bgColor);
		if (values.bgColor.alpha neq "") {
			values.bgAlpha = values.bgColor.alpha;
		} else {
			values.bgAlpha = inputBaseN(values.bgAlpha, 10);
		}
		
		values.strokeColor = $stringToHexColor(values.strokeColor); 
		if (values.strokeColor.alpha neq "") {
			values.strokeAlpha = values.strokeColor.alpha;
		} else {
			values.strokeAlpha = inputBaseN(values.strokeAlpha, 10);
		}
		
		values.quoteColor = $stringToHexColor(values.quoteColor); 
		if (values.quoteColor.alpha neq "") {
			values.quoteAlpha = values.quoteColor.alpha;
		} else {
			values.quoteAlpha = inputBaseN(values.quoteAlpha, 10);
		}
		
		values.shadowColor = $stringToHexColor(values.shadowColor); 
		if (values.shadowColor.alpha neq "") {
			values.shadowAlpha = values.shadowColor.alpha;
		} else {
			values.shadowAlpha = inputBaseN(values.shadowAlpha, 10);
		}
		
		
		
		local.textFont = $getFont(fontName=values.font, fontStyle=values.fontStyle, fontSize=values.fontSize);
		local.graphics = imageGetBufferedImage(image).createGraphics();
		
		// create instances of Color
		local.classes.Color = createObject("java", "java.awt.Color");
		
		
		local.bgColor = local.classes.Color.init(
			javacast("int", values.bgColor.rgba[1]),
			javacast("int", values.bgColor.rgba[2]),
			javacast("int", values.bgColor.rgba[3]),
			javacast("int", values.bgAlpha)
		);
		
		local.fgColor = local.classes.Color.init(
			javacast("int", values.fgColor.rgba[1]),
			javacast("int", values.fgColor.rgba[2]),
			javacast("int", values.fgColor.rgba[3]),
			javacast("int", values.fgAlpha)
		);
		
		local.strokeColor = local.classes.Color.init(
			javacast("int", values.strokeColor.rgba[1]),
			javacast("int", values.strokeColor.rgba[2]),
			javacast("int", values.strokeColor.rgba[3]),
			javacast("int", values.strokeAlpha)
		);
		
		local.quoteColor = local.classes.Color.init(
			javacast("int", values.quoteColor.rgba[1]),
			javacast("int", values.quoteColor.rgba[2]),
			javacast("int", values.quoteColor.rgba[3]),
			javacast("int", values.quoteAlpha)
		);
		
		local.shadowColor = local.classes.Color.init(
			javacast("int", values.shadowColor.rgba[1]),
			javacast("int", values.shadowColor.rgba[2]),
			javacast("int", values.shadowColor.rgba[3]),
			javacast("int", values.shadowAlpha)
		);
		
		
		
		// use $getLayouts function to get an ArrayList (java.util.ArrayList)
		// the ArrayList contains all the text-layouts we need to draw
		// each textlayout defines one line of text
		local.layouts = $getLayouts(local.graphics, local.textFont, text, values.wrapWidth);
		
		// we iterate the arrayList to add up dimension of all lines
		// calculate dimension for our graphics
		// we are not drawing any text in this while() loop
		// we just calculate width and height
		local.it = local.layouts.iterator();
		local.width = values.wrapWidth; 
		local.height = 0;
		
		// java classes we will use: 
		local.classes.AffineTransform = createObject("java", "java.awt.geom.AffineTransform");
		local.classes.Font = createObject("java", "java.awt.Font");
		local.classes.BasicStroke = createObject("java", "java.awt.BasicStroke");
		local.classes.Point = createObject("java", "java.awt.Point");
		local.classes.Rectangle = createObject("java", "java.awt.Rectangle");
		local.classes.Polygon = createObject("java", "java.awt.Polygon");
		local.classes.RenderingHints = createObject("java", "java.awt.RenderingHints");
		local.classes.GradientPaint = createObject("java", "java.awt.GradientPaint");
		local.classes.AlphaComposite = createObject("java", "java.awt.AlphaComposite");
		local.classes.Math = createObject("java", "java.lang.Math");
		
		local.pen = local.classes.Point.init(0,0);
		local.counter = 0;
		while (local.it.hasNext()) {
			local.tl = local.it.next();
			local.bounds = local.tl.getBounds();
			switch (values.style) {
				case "twitter": case "stroked":
					local.basicStroke = local.classes.BasicStroke.init(local.textFont.getSize() / 6, local.classes.BasicStroke.CAP_ROUND, local.classes.BasicStroke.JOIN_ROUND);
	                local.pen.y += local.tl.getAscent();
	                local.pen.x = local.textFont.getSize()/8;
	                local.shape = local.tl.getOutline(local.classes.AffineTransform.getTranslateInstance(local.pen.x, local.pen.y));
	                local.strokedShape = local.basicStroke.createStrokedShape(local.shape);
	                local.shapeDimension = local.strokedShape.getBounds2D();
	                local.pen.y += (local.shapeDimension.getHeight() - local.tl.getAscent() + local.tl.getDescent());
					local.width = max(local.width, local.shapeDimension.getWidth() + local.textFont.getSize()/8);
					local.height = local.pen.y + local.tl.getDescent();
				break;
				case "quote": case "blockquote":
					if (local.width < max(local.tl.getAdvance(), local.bounds.getWidth()) + Min(80, local.textFont.getSize() * 2)) {
						local.width = max(local.tl.getAdvance(), local.bounds.getWidth()) + Min(80, local.textFont.getSize() * 2);
					}
					local.height += local.tl.getAscent() + local.tl.getDescent();
				break;
				case "simple":
				default:
					if (local.width < max(local.tl.getAdvance(), local.bounds.getWidth())) {
						local.width = max(local.tl.getAdvance(), local.bounds.getWidth());
					}
					local.height += local.tl.getAscent() + local.tl.getDescent();
				break;
			}
			local.counter++;
		}
		
		// paddings
		local.height += values.top;
		local.height += values.bottom;
		local.width += values.left;
		local.width += values.right;
		
		if (values.shadow eq true) {
			local.width += abs(values.shadowX);
			local.height += abs(values.shadowY);
		}
		
		local.imageHeight = local.height;
		
		if (values.reflection eq true) {
			local.reflectionHeight = (local.imageHeight * (values.reflectHeight));
			local.height += local.reflectionHeight + values.reflectGap;
		}
		
		
		// create blank image
		local.finalImage = imageNew("", ceiling(local.width), ceiling(local.height), "argb");
		local.image = imageGetBufferedImage(local.finalImage);
		
		if (values.reflection eq true) {
			// create blank image
			local.reflectionImage = imageNew("", ceiling(local.width), ceiling(local.imageHeight), "argb");
			local.reflectionBuffImg = imageGetBufferedImage(local.reflectionImage);
			local.reflectionGraphics = local.reflectionBuffImg.createGraphics();
		}
		
		// now draw the image
		local.it = local.layouts.iterator();
		local.g2d = local.image.createGraphics();
		local.pen = local.classes.Point.init(0,0);
		
		if (values.shadow eq true) {
			if (values.shadowX lt 0) {
				local.pen.x = abs(values.shadowX);
			}
			if (values.shadowY lt 0) {
				local.pen.y = abs(values.shadowY);
			}
			local.shadowTransform = local.classes.AffineTransform.getTranslateInstance(values.shadowX, values.shadowY);
			local.shadowStroke = local.classes.BasicStroke.init(1, local.classes.BasicStroke.CAP_ROUND, local.classes.BasicStroke.JOIN_ROUND);
		}
		
		// move pen from top as per padding value
		local.pen.x +=  values.left;
		local.pen.y +=  values.top;
		
		// since drawing 'text' with Java AWT
		// by-default uses low quality rendering, 
		// we will fix that using RenderingHints
		local.g2d.setRenderingHint(local.classes.RenderingHints.KEY_ANTIALIASING,
                local.classes.RenderingHints.VALUE_ANTIALIAS_ON);
        local.g2d.setRenderingHint(local.classes.RenderingHints.KEY_ALPHA_INTERPOLATION,
                local.classes.RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);
        local.g2d.setRenderingHint(local.classes.RenderingHints.KEY_INTERPOLATION,
            local.classes.RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		//
		//local.bgRectangle = local.classes.Rectangle.init(-1, -1, local.width+1, local.height+1);
        //local.g2d.setColor(local.bgColor);
        //local.g2d.draw(local.bgRectangle);
        //local.g2d.fill(local.bgRectangle);
		if (values.stickerStyle eq "ne" OR values.stickerStyle eq "nw" OR values.stickerStyle eq "se" OR values.stickerStyle eq "sw") {
			local.g2d.setColor(local.bgColor);
		} else {
			local.g2d.setColor(local.bgColor);
	    	local.g2d.fillRoundRect(0, 0, local.width, local.height, min(values.cornerRadius*2, local.height), min(values.cornerRadius*2, local.height));
		}
		//
		//local.g2d.setColor(local.fgColor);
		//
		local.startPen = local.pen.clone();
		local.counter = 0;
		while (local.it.hasNext()) {
			local.tl = local.it.next();
			switch (values.style) {
				case "twitter": case "stroked":
					local.g2d.setColor(local.classes.Color.WHITE);	
	                local.basicStroke = local.classes.BasicStroke.init(local.textFont.getSize() / 6, local.classes.BasicStroke.CAP_ROUND, local.classes.BasicStroke.JOIN_ROUND);
	                local.pen.y += local.tl.getAscent() + local.textFont.getSize() / 6;
	                local.pen.x = local.startPen.x + local.textFont.getSize()/8;
	                local.shape = local.tl.getOutline(local.classes.AffineTransform.getTranslateInstance(local.pen.x, local.pen.y));
	                local.strokedShape = local.basicStroke.createStrokedShape(local.shape);
	                local.shapeDimension = local.strokedShape.getBounds2D();
	                if (values.shadow eq true) {
						local.g2d.setColor(local.shadowColor);
						local.shadowShapeTransform = local.classes.AffineTransform.getTranslateInstance(local.pen.x, local.pen.y);
						local.shadowShapeTransform.concatenate(local.shadowTransform);
						local.g2d.setColor(local.shadowColor);
		                local.g2d.fill(local.shape);
						local.shadowShape = local.basicStroke.createStrokedShape(local.shadowTransform.createTransformedShape(local.strokedShape));
						
						local.g2d.fill(local.shadowShape);
					}
					local.g2d.setColor(local.strokeColor);
	                local.g2d.draw(local.strokedShape);
	                local.g2d.fill(local.strokedShape);
	                local.g2d.setColor(local.fgColor);
	                local.g2d.fill(local.shape);
	                local.pen.y += (local.shapeDimension.getHeight() - local.tl.getAscent());
					
				break;
				case "quote": case "blockquote":
					if (local.counter == 0) {
						local.serif = $getFont("Serif", "bold", Min(local.height + values.top, 45) * 3);
						local.g2d.setColor(local.quoteColor);
						local.g2d.setFont(local.serif);
						local.g2d.drawString(values.quoteChar, javacast("int", values.left), javacast("int", Min(local.height + values.top, 50) * 2));
					}
					local.pen.y += local.tl.getAscent();
	                if (values.shadow eq true) {
						local.g2d.setColor(local.shadowColor);
						local.shadowShapeTransform = local.classes.AffineTransform.getTranslateInstance(local.pen.x + Min(80, local.textFont.getSize() * 2), local.pen.y);
						local.shadowShapeTransform.concatenate(local.shadowTransform);
						local.shadowShape = local.shadowStroke.createStrokedShape(local.shadowShapeTransform.createTransformedShape(local.tl.getOutline(javacast("null", ""))));
						local.g2d.draw(local.shadowShape);
						local.g2d.fill(local.shadowShape);
					}
					local.g2d.setColor(local.fgColor);
					local.tl.draw(local.g2d, javacast("float", local.pen.x + Min(80, local.textFont.getSize() * 2)), javacast("float", local.pen.y));
	                local.pen.y += local.tl.getDescent();
				break;
				case "simple":
				default:
					local.pen.y += local.tl.getAscent();
					if (values.shadow eq true) {
						local.g2d.setColor(local.shadowColor);
						local.shadowShapeTransform = local.classes.AffineTransform.getTranslateInstance(local.pen.x, local.pen.y);
						local.shadowShapeTransform.concatenate(local.shadowTransform);
						local.shadowShape = local.shadowStroke.createStrokedShape(local.shadowShapeTransform.createTransformedShape(local.tl.getOutline(javacast("null", ""))));
						local.g2d.draw(local.shadowShape);
						local.g2d.fill(local.shadowShape);
					}
					local.g2d.setColor(local.fgColor);
	                local.tl.draw(local.g2d, javacast("float", local.pen.x), javacast("float", local.pen.y));
	                local.pen.y += local.tl.getDescent();
				break;
			}
			local.counter++;
		}
		
		if (values.shadow eq true) {
			if (values.shadowX lt 0) {
				local.pen.x = abs(values.shadowX);
			}
			if (values.shadowY lt 0) {
				local.pen.y = abs(values.shadowY);
			}
		}
		
		
		if (values.reflection eq true) {
			local.reflectionGraphics.drawRenderedImage( local.image, local.classes.AffineTransform.getScaleInstance(1, 1) );
			
			local.g2d.translate( 0, 2*local.imageHeight+(values.reflectGap-(local.tl.getDescent()/1.25)) );
        	local.g2d.scale( 1, -1 );
			
			local.reflectionGraphics.setComposite( local.classes.AlphaComposite.getInstance( local.classes.AlphaComposite.DST_IN ) );
	        local.reflectionGraphics.setPaint(
	            local.classes.GradientPaint.init(
	                0, local.imageHeight*values.fadeHeight, local.classes.Color.init(
						javacast("float", 0),
						javacast("float", 0),
						javacast("float", 0),
						javacast("float", 0)
					), 0, local.imageHeight, local.classes.Color.init(
						javacast("float", 0),
						javacast("float", 0),
						javacast("float", 0),
						javacast("float", (values.reflectOpacity/255))
					)
				)
	        );
			
			
	        local.reflectionGraphics.fillRect( 0, 0, local.width, local.imageHeight );
			
			local.reflectionImg = imageNew("", ceiling(local.width), ceiling(local.height), "argb");
			local.reflectionBi = imageGetBufferedImage(local.reflectionImg);
			
			
	        local.g2d.drawRenderedImage( local.reflectionBuffImg, javacast("null",""));
			
			local.reflectionGraphics.dispose();
		}
		
		if (values.stickerStyle neq "") {
			if (values.stickerStyle neq "east" AND values.stickerStyle neq "west") {
				local.stickerWidth = ((local.width / sqr(2)) + ((local.height*2) / sqr(2)));
				local.stickerHeight = local.stickerWidth;
			} else {
				local.stickerWidth = local.height;
				local.stickerHeight = local.width;
			}
			local.stickerImage = imageNew("", local.stickerWidth, local.stickerHeight, "argb");
			local.stickerBuffImg = imageGetBufferedImage(local.stickerImage);
			local.stickerGraphics = local.stickerBuffImg.createGraphics();
			local.stickerGraphics.setRenderingHint(local.classes.RenderingHints.KEY_INTERPOLATION,
                local.classes.RenderingHints.VALUE_INTERPOLATION_BICUBIC);
			if (values.stickerStyle eq "ne" OR values.stickerStyle eq "nw" OR 
						values.stickerStyle eq "se" OR values.stickerStyle eq "sw") {
				local.stickerGraphics.setColor(local.bgColor);
				local.stickerPoly1 = local.classes.Polygon.init();
			}
			switch (values.stickerStyle) {
				case "ne": case "nw":
					local.offset = local.width / sqr(2);
					local.stickerPoly1.addPoint(0, 0);
					local.stickerPoly1.addPoint(0 - local.height, local.height);
					local.stickerPoly1.addPoint(local.width + local.height, local.height);
					local.stickerPoly1.addPoint(local.width, 0);
					break;
				case "se": case "sw":
					local.offset = (local.width + (local.height)) / sqr(2);
					local.stickerPoly1.addPoint(0, 0);
					local.stickerPoly1.addPoint(0 - local.height, 0);
					local.stickerPoly1.addPoint(0, local.height);
					local.stickerPoly1.addPoint(local.width, local.height);
					local.stickerPoly1.addPoint(local.width+local.height, 0);
					break;
			}
			switch (values.stickerStyle) {
				case "ne":
					local.stickerGraphics.translate(local.stickerWidth - local.offset, 0);
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(45)));
				break;
				case "nw":
					local.stickerGraphics.translate(0, local.offset);
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(315)));
				break;
				case "sw":
					local.stickerGraphics.translate(local.height/sqr(2), local.stickerHeight - local.offset);
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(45)));
				break;
				case "se":
					local.stickerGraphics.translate(local.stickerWidth - local.offset, local.stickerHeight - local.height/sqr(2));
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(315)));
				break;
				case "east":
					local.stickerGraphics.translate(0, local.stickerHeight);
        			local.stickerGraphics.scale(-1,-1);
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(90)));
				break;
				case "west":
				default:
					local.stickerGraphics.translate(local.stickerWidth, 0);
					local.stickerGraphics.transform(local.classes.AffineTransform.getRotateInstance(local.classes.Math.toRadians(90)));
				break;
			}
			if (values.stickerStyle eq "ne" OR values.stickerStyle eq "nw" OR 
						values.stickerStyle eq "se" OR values.stickerStyle eq "sw") {
				local.stickerGraphics.fillPolygon(local.stickerPoly1);
				//local.stickerGraphics.fillPolygon(local.stickerPoly2);
			}
			local.stickerGraphics.drawRenderedImage(local.image, local.classes.AffineTransform.getTranslateInstance(0, 0));
			//
			//
			local.g2d.dispose();
			local.finalImage = local.stickerImage;
		}
		//
		local.graphics.dispose();
		local.g2d.dispose();
		//
		local.imageName = $getChecksum(text & serializeJSON(options));
		local.directoryPath = getArtDirectory();
		//
		imagePath = local.directoryPath & local.imageName & ".png";
		//
		if (directoryExists(local.directoryPath) eq false) {
			directoryCreate8(local.directoryPath);
		}
		//
		if (fileExists(imagePath)) {
			fileDelete(imagePath);
		}
		imageWrite(local.finalImage, imagePath, 1);
	</cfscript>
	<cfset structClear(local) />
	<cfreturn imagePath />
</cffunction>
<cffunction name="$getLayouts" returntype="Any"
		hint="This function returns a java ArrayList that contains TextLayout instances depending on the number of lines needed.">
	<cfargument name="g2d" type="Any" required="true" />
	<cfargument name="textFont" type="Any" required="true" />
	<cfargument name="text" type="Any" required="true" />
	<cfargument name="wrappingWidth" type="Numeric" required="false" default="0" />
	<cfscript>
		var layouts = createObject("java", "java.util.ArrayList").init();
		var pen = createObject("java", "java.awt.Point").init(0,0);
		var frc = g2d.getFontRenderContext();
		var fontMetrics = g2d.getFontMetrics();
		var attrStr = createObject("java", "java.text.AttributedString").init(text);
		var textAttribute = createObject("java", "java.awt.font.TextAttribute");
		var attrChrIterator = attrStr.getIterator();
		var breakIter = createObject("java", "java.text.BreakIterator").getLineInstance();
		var Character = createObject("java", "java.lang.Character");
		var textLayout = createObject("java", "java.awt.font.TextLayout");
		var pos = 0;
	    var limit = attrChrIterator.getEndIndex();
	    var layoutLimit = pos;
		var textpart = javacast("string","");
        var charAtMaxAdvance = 0;
		var testPos = 0;
		var tl = "";
		var str = javacast("string","");
		breakIter.setText(text);
		attrStr.addAttribute(textAttribute.FONT, textFont, 0, len(text));
        g2d.setFont(textFont);
		frc = g2d.getFontRenderContext();
		fontMetrics = g2d.getFontMetrics();
		if (wrappingWidth lt 1) {
			wrappingWidth = fontMetrics.stringWidth(javacast("string", text & "  "));
		}
		while (pos < limit) {
			do {
	            textpart = textpart.concat(text.substring(layoutLimit, ++layoutLimit));
	            charAtMaxAdvance = layoutLimit;
	        } while (fontMetrics.stringWidth(textpart) + fontMetrics.stringWidth(javacast("string","  ")) < wrappingWidth &&
	                layoutLimit < limit);
			if (charAtMaxAdvance == limit) {
	            layoutLimit = limit;
	        } else if (Character.isWhitespace(attrChrIterator.setIndex(charAtMaxAdvance))) {
	            layoutLimit = breakIter.following(charAtMaxAdvance);
	        } else {
	            testPos = charAtMaxAdvance + 1;
	            if (testPos == limit) {
	                breakIter.last();
	                layoutLimit = breakIter.previous();
	            } else {
	                layoutLimit = breakIter.preceding(testPos);
	            }
	
	            if (layoutLimit <= pos) {
	                layoutLimit = Max(pos + 1, charAtMaxAdvance);
	            }
	        }
			str = text.substring(pos, layoutLimit);
            tl = textLayout.init(str, textFont, frc);

            layouts.add(tl);
			textpart = "";
            pos = layoutLimit;
		}
		return layouts;
    </cfscript>
</cffunction>
<cffunction name="$getFont" returntype="Any">
	<cfargument name="fontName" type="String" required="true" hint="Pass font name without ttf. Font file will be checked in site's font directory. If font file is not found there, system font folder will be used. If font is not found in either of the two directories, 'serif' font will be used." />
	<cfargument name="fontStyle" type="String" required="false" default="bold" hint="valid values are plain, bold, italic, bolditalic" />
	<cfargument name="fontSize" type="Numeric" required="false" default="24" />
	<cfscript>
	    var file = createObject("java", "java.io.File").init(
			getFontDirectory() & fontName & ".ttf"
		);
	    var dynamicFont = "";
		var myFont = "";
		var fileStream = "";
		var fontClass = createObject("java", "java.awt.Font");
		var fontStyleInt = 0;
		switch (fontStyle) {
			case "bold":
				fontStyleInt = fontClass.BOLD;
			break;
			case "italic":
				fontStyleInt = fontClass.ITALIC;
			break;
			case "bolditalic":
				fontStyleInt = bitXor(fontClass.BOLD, fontClass.ITALIC);
			break;
		}
		try {
			if (fileExists(getFontDirectory() & fontName & ".ttf")) {
				fileStream = createObject("java", "java.io.FileInputStream").init(file);
				dynamicFont = fontClass.createFont(fontClass.TRUETYPE_FONT, fileStream);
				myFont = dynamicFont.deriveFont(fontStyleInt, fontSize);
			} else {
				myFont = fontClass.init(fontName, fontStyleInt, fontSize);
			}
	    } catch(any exception) {
			writeOutput("<!-- " & exception.detail & " -->");
			writeOutput("<!-- " & fontName & " not loaded.  Using serif font. -->");
			myFont = fontClass.init("serif", fontStyleInt, fontSize);
	    }
	</cfscript>
	<cfreturn myFont />
</cffunction>
<cffunction name="$hexToRGB" returntype="Array">
	<cfargument name="strHEX" required="true" type="String" />
	<cfset var returnArray = ArrayNew(1)/>
	<cfset returnArray[1] = inputBaseN( mid( strHEX, 1, 2 ), 16 )>
	<cfset returnArray[2] = inputBaseN( mid( strHEX, 3, 2 ), 16 )>
	<cfset returnArray[3] = inputBaseN( mid( strHEX, 5, 2 ), 16 )>
	<cfreturn returnArray />
</cffunction>
<cffunction name="$stringToHexColor" returntype="Struct">
	<cfargument name="str" required="true" type="String" />
	<cfset var returnVal = structNew() />
	<!---
		The returned struct will contain:
			1. alpha 			(transparency as integer) (values from 0 to 255)
			2. hex 				(6 digit hexadecimal: FF0000 )
			3. rgba 			(array) ([255, 0, 0, 255]) [r, g, b, a]
			4. alphaPercent 	(1 to 100)
			5. hex8				(8 digit hexadecimal with transparency in first two digits)
								(Example: opaque color red will be represented as FFFF0000) 
	--->
	<cfscript>
		if (left(str, 1) eq "##") {
			// remove the hash symbol usually added to hex color string
			str = right(str, len(str) - 1);
		}
		if (len(str) lt 3) {
			// string is less than 3 digit hex!
			// pad 0s to make it a 3 digit hex
			str = str & repeatString("0", 3 - len(str));  
		}
		if (len(str) eq 3) {
			// expand 3digit hex to 8 digit hex
			str = left(str,1) & left(str,1) & mid(str,2,1) & mid(str,2,1) & right(str,1) & right(str,1);
		}
		if (len(str) lte 6) {
			// expand 6 digit hex to 8 digit hex
			// first two "FF" says it is opaque as opposed to transparent "00"
			str = str & repeatString("0", 6 - len(str));
		}
		if (len(str) eq 8) {
			returnVal.alpha = inputBaseN(left(str, 2), 16);
			returnVal.hex = right(str, 6);
			returnVal.alphaPercent = round(returnVal.alpha / 2.55);
		} else {
			returnVal.alpha = "";
			returnVal.hex = right(str, 6);
			returnVal.alphaPercent = "";
		}
		returnVal.hex8 = str;
		returnVal.rgba = $hexToRGB(returnVal.hex);
		arrayAppend(returnVal.rgba, returnVal.alpha);
	</cfscript>
	<cfreturn returnVal />
</cffunction>
<cffunction name="$getChecksum" returntype="String">
	<cfargument name="str" type="String" required="true" />
	<cfreturn hash(str) />
</cffunction>
<cffunction name="directoryCreate8" access="public" returntype="void" output="no">

	<cfargument name="dirname" required="true" type="String" />
	
	<cfdirectory 
		action="create"
		directory="#arguments.dirname#" 
		name="CreateFolder"
	/>
	
</cffunction>
</cfcomponent>