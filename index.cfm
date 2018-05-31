
<div id="NBpage">
  <div class="grid grid-pad">
  	
<!--- LOGO LIST GENERATOR --->
<h1>Generate logo file list for Akamai to purge</h1>

<div class="col-1-1 grid-margin-bottom">
	<cfform>
		<input type="text" name="CompanyID" placeholder="Enter one company ID here">
		<input  type="submit" name="" value="Generate a new list!!!!" class="NB1button">
	</cfform>
</div>


<cfif isDefined("FORM") and structKeyExists(FORM,"CompanyID") and CompanyID eq "">
	<p class="font-important">
		You must enter a Company ID.
	</p>

<!--- IF FORM WITH CompanyID EXISTS AND HAS A VALUE --->
<!--- <cfif isDefined("form.CompanyID") AND CompanyID NEQ "">--->
<cfelseif isDefined("FORM") and structKeyExists(FORM,"CompanyID") and CompanyID neq "">
	<cfscript>
	 
		MediumListLinkCDN = "http://cdn-images.av-iq.com/company/";
		Button2LinkCDN = "http://cdn-images.av-iq.com/company/button2/";
		SmallsquareLinkCDN = "http://cdn-images.av-iq.com/company/smallsquare/";

		MediumListLinkAVIQ = "http://www.av-iq.com/avcat/images/company/";
		Button2LinkAVIQ = "http://www.av-iq.com/avcat/images/company/button2/";
		SmallsquareLinkAVIQ = "http://www.av-iq.com/avcat/images/company/smallsquare/";

		// CompanyID = "";  // this value is entered into the form by the user
		CompanyID = CompanyID.trim();

		FileNameMedium = "medium";
		FileNameList = "list";
		FileNameButton2 = "button2";
		FileNameSmallsquare = "smallsquare";

		FileExtention = ".gif";

		// logo file paths generated for images on CDN
		MediumLogoGeneratedCDN = MediumListLinkCDN & CompanyID & FileNameMedium & FileExtention;
		ListLogoGeneratedCDN = MediumListLinkCDN & CompanyID & FileNameList & FileExtention;
		Button2LogoGeneratedCDN = Button2LinkCDN & CompanyID & FileNameButton2 & FileExtention;
		SmallsquareLogoGeneratedCDN = SmallsquareLinkCDN & CompanyID & FileNameSmallsquare & FileExtention;

		// logo file paths generated for images on AVIQ
		MediumLogoGeneratedAVIQ = MediumListLinkAVIQ & CompanyID & FileNameMedium & FileExtention;
		ListLogoGeneratedAVIQ = MediumListLinkAVIQ & CompanyID & FileNameList & FileExtention;
		Button2LogoGeneratedAVIQ = Button2LinkAVIQ & CompanyID & FileNameButton2 & FileExtention;
		SmallsquareLogoGeneratedAVIQ = SmallsquareLinkAVIQ & CompanyID & FileNameSmallsquare & FileExtention;

		// components of anchor tag
		LinkTagStart1 = "<a target='_blank' href='";
		LinkTagStart2 = "'>";		
		LinkTagEnd = "</a>";

		// components of image tag
		ImageTagStart = "<img src='";
		ImageTagEnd = "'>";		

		// clickable links for logos on CDN
		MediumLogoClickable = LinkTagStart1 & MediumLogoGeneratedCDN & LinkTagStart2 & MediumLogoGeneratedCDN & LinkTagEnd;
		ListLogoClickable = LinkTagStart1 & ListLogoGeneratedCDN & LinkTagStart2 & ListLogoGeneratedCDN & LinkTagEnd;
		Button2LogoClickable = LinkTagStart1 & Button2LogoGeneratedCDN & LinkTagStart2 & Button2LogoGeneratedCDN & LinkTagEnd;
		SmallsquareLogoClickable = LinkTagStart1 & SmallsquareLogoGeneratedCDN & LinkTagStart2 & SmallsquareLogoGeneratedCDN & LinkTagEnd;

		// clickable list of links for CDN logos
		ListOfLinks = 
			MediumLogoClickable 
			& "<br>" 
			& ListLogoClickable
			& "<br>"
			& Button2LogoClickable
			& "<br>"
			& SmallsquareLogoClickable;

		// image tags for logos on AVIQ live server
		ImageTagMediumOnAVIQ = ImageTagStart & MediumLogoGeneratedAVIQ & ImageTagEnd;
		ImageTagListOnAVIQ = ImageTagStart & ListLogoGeneratedAVIQ & ImageTagEnd;
		ImageTagButton2OnAVIQ = ImageTagStart & Button2LogoGeneratedAVIQ & ImageTagEnd;
		ImageTagSmallsquareOnAVIQ = ImageTagStart & SmallsquareLogoGeneratedAVIQ & ImageTagEnd;

		// image tags for logos cached on cdn server by Akamai
		ImageTagMediumOnCDN = ImageTagStart & MediumLogoGeneratedCDN & ImageTagEnd;
		ImageTagListOnCDN = ImageTagStart & ListLogoGeneratedCDN & ImageTagEnd;
		ImageTagButton2OnCDN = ImageTagStart & Button2LogoGeneratedCDN & ImageTagEnd;
		ImageTagSmallsquareOnCDN = ImageTagStart & SmallsquareLogoGeneratedCDN & ImageTagEnd;

	</cfscript>





	<cfif IsNumeric(CompanyID)> 
		<cfoutput>
			<!--- Is entry numeric? #IsNumericEntry# --->
			<div class="col-1-1">			
					#ListOfLinks#			
			</div>
			<div class="col-6-12">
				<h2>Logos on AV-iQ Live Server</h2>
					<p>
						<h3>medium</h3> 
						#ImageTagMediumOnAVIQ#
					</p>
					<p>
						<h3>list</h3>
						#ImageTagListOnAVIQ#
					</p>
					<p>
						<h3>button2</h3>
						#ImageTagButton2OnAVIQ#
					</p>
					<p>
						<h3>smallsquare</h3>
						#ImageTagSmallsquareOnAVIQ#
					</p>						
			</div>
			<div class="col-6-12">
				<h2>Logos Cached on CDN by Akamai</h2>
					<p>
						<h3>medium</h3> 
						#ImageTagMediumOnCDN#
					</p>
					<p>
						<h3>list</h3>
						#ImageTagListOnCDN#
					</p>
					<p>
						<h3>button2</h3>
						#ImageTagButton2OnCDN#
					</p>
					<p>
						<h3>smallsquare</h3>
						#ImageTagSmallsquareOnCDN#
					</p>						
			</div>
		</cfoutput>
	<cfelse>
		<cfoutput>
			<div class="col-1-1">
				<p class="font-important">
					"#CompanyID#" is not a numeric entry. You must enter a number.
				</p>
			</div>
		</cfoutput>
	</cfif>

<cfelse>
	<!--- do nothing --->
</cfif>



<!---
<cfdump var="#form#">
--->
	
<p>
	<a href="index.cfm?user=steph">
		Refresh the page
	</a>
</p>
	
  </div>
</div>

