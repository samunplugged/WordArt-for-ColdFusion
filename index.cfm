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


<h1>WordArt CFC</h1>
<p>
WordArt for ColdFusion is available for free under new BSD License.
</p> 
<p>
You're using <cfoutput>#server.coldfusion.productname# #server.coldfusion.productversion#</cfoutput>
</p>
<p>
WordArt CFC generates image for insertion of typography on a webpage by converting text to image in various styles. There are over 25 different options available in this first release of WordArt. 
</p>

<h2>Help</h2>
<p>
Detailed help is available at: <a href="https://github.com/samunplugged/WordArt-for-ColdFusion">https://github.com/samunplugged/WordArt-for-ColdFusion</a>. WordArt CFC allows you to pass over 30 different options. So check them out.
</p>

	<!--- Since I would like this demo to run for everybody and
	also for those who use CFWheels here is an CFIF statement --->
	<cfif isDefined("application.wheels.plugins.wordart") eq false>
		<!--- since this is not cfwheels application.
		we assume you are just testing WordArt cfc and therefore we are going to store images in wordart folder.
		 We change urlPath from absolute to relative.
		 From "/images/wordart/" to "images/wordart/", removing the forward slash "/" at the beginning.
		 In most cases if you place images folder in site's root directory,
		 you will not pass urlPath and will just use init().
		 --->
		<cfset wordart = createObject("component", "wordart").init(urlPath="wordart", artDir=expandPath("wordart")) />
	<cfelse>
		<!--- for cfwheels application:  --->
		<cfset wordart = createObject("component", "wordart").init() />
	</cfif>
<cftry>
<cfcatch type="any">
	<h2>An error occured when calling createObject("component", "wordart").init() </h2>
	<p>Please make sure that you are allowed to use "createObject" method and that the wordart.cfc exists in this directory</p>
	<h3>Error details:</h3>
	<cfoutput><p>#cfcatch.detail#</p></cfoutput>
	<hr />
</cfcatch>
</cftry>

<cfif isDefined("wordart") eq true>
<h2>Examples:</h2>



<h3>Example 1:</h3>
<pre>
wordart.getArt(text="The future is written in ColdFusion")
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text="The future is written in ColdFusion")#</cfoutput>
</p>
<hr />
<h3>Example 2:</h3>
<pre>
wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", 
options={style="simple", font="Trebuchet MS", fontstyle="bolditalic", fontSize=30})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", options={style="simple", font="Trebuchet MS", fontstyle="bolditalic", fontSize=30})#</cfoutput>
</p>
<hr />
<h3>Example 3:</h3>
<pre>
wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", 
options={style="simple", font="Trebuchet MS", fontstyle="bolditalic", 
fontSize=30, wrapWidth=350}, useCache=false)
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", 
	options={style="simple", font="Trebuchet MS", fontstyle="bolditalic", fontSize=30, wrapWidth=350})#</cfoutput>
</p>
<hr />
<h3>Example 4:</h3>
<pre>
wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", 
options={style="blockquote", font="Trebuchet MS", fontstyle="bolditalic", 
fontSize=30, wrapWidth=350})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text="CFWheels is the future and the future is written in ColdFusion", options={style="blockquote", font="Trebuchet MS", fontstyle="bolditalic", fontSize=30, wrapWidth=350})#</cfoutput>
</p>
<hr />
<h3>Example 5:</h3>
<pre>
wordart.getArt(text='Start', 
options={style="stroked", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
top=3, left=9, right=9, bottom=3, fgColor="##FFFFFFFF", strokeColor="##FF000000", reflection=true})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='Start', 
    options={style="stroked", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
    top=3, left=9, right=9, bottom=3, fgColor="##FFFFFFFF", strokeColor="##FF000000", reflection=true})#</cfoutput>
</p>
<hr />
<h3>Example 6:</h3>
<pre>
wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="PICOBLA_", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", reflection=true})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="PICOBLA_", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", reflection=true})#</cfoutput>
</p>
<hr />
<h3>Example 7:</h3>
<pre>
wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="PICOBLA_", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", reflection=true,
       top=10, left=10, right=10})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="PICOBLA_", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", reflection=true,
	   top=10, left=10, right=10})#</cfoutput>
</p>
<hr />
<h3>Example 8:</h3>
<pre>
wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="PICOBLA_", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", 
		stickerStyle="se"})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='tell-a-friend', 
    options={style="simple", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
       bgColor="##FF111111", fgColor="##FFFFFFFF", 
		stickerStyle="se"})#</cfoutput>
</p>
<hr />
<h3>Example 9:</h3>
<pre>
wordart.getArt(text='Wheels on Fire', 
    options={style="simple", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
    bgColor="##FFc8c6c3", fgColor="##FF565656", 
    top=10, left=10, right=10, bottom=10, stickerStyle="ne"})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='Wheels on Fire', 
    options={style="simple", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
    bgColor="##FFc8c6c3", fgColor="##FF565656", 
    top=10, left=10, right=10, bottom=10, stickerStyle="ne"})#</cfoutput>
</p>
<hr />
<h3>Example 10:</h3>
<pre>
wordart.getArt(text='Start', 
    options={style="simple", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
    top=3, left=9, right=9, bottom=3, cornerRadius=8, bgColor="##fffb2222", fgColor="##FFFFFFFF"})
</pre>
Output:
<p>
	<cfoutput>#wordart.getArt(text='Start', 
    options={style="simple", font="Trebuchet MS", fontSize=24, fontStyle="bold", 
    top=3, left=9, right=9, bottom=3, cornerRadius=8, bgColor="##fffb2222", fgColor="##FFFFFFFF"}, useCache=false)#</cfoutput>
</p>
<hr />
<h1>Want more examples?</h1>
<p>Head to this projects wiki, were you will find many more examples: <a href="https://github.com/samunplugged/WordArt-for-ColdFusion">https://github.com/samunplugged/WordArt-for-ColdFusion</a></p>
</cfif>
<hr />
&copy; Copyright, 2009. <a href="https://github.com/samunplugged">Sameer Gupta</a>. All rights reserved. <a href="http://labs.codecurry.com/wiki/wordart-cfc">WordArt for ColdFusion</a> is available for free. Read LICENSE file for more deails. 
<hr />
