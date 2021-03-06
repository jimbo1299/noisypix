<cfapplication name="imgUpload" sessionmanagement="true" sessiontimeout="#createTimeSpan(0,0,30,0)#">
<cfparam name="strMyId" type="string" default="">
<cfscript>
	variables.stuMsg				= {};
	variables.stuMsg.strMsg			= "success";
	variables.stuMsg.bError			= false;
	variables.intPercentDecrease	= 50;
	variables.intPercentDecrease	= 50;

	variables.strLstFiles			= "jpg,jpeg,gif,bmp,png";
	variables.strLstFilters			= "*.jpg|*.jpeg|*.gif|*.bmp|*.png";
	
	variables.strZipDirectory		= getDirectoryFromPath(getCurrentTemplatePath()) & "files\";
	//This is where we're gonna store the shrunk image, note the custom dir for keeping user files together
	variables.strSmallDirectory		= variables.strZipDirectory & "#strMyId#\";
	
</cfscript>
<cftry>
	<cfif structKeyExists(form,"uploadFile")>
		<!--- If Directory doesn't exist, create it.(It should be unique for each user) --->
		<cfif not directoryExists(variables.strSmallDirectory)>
			<cfdirectory action="create" directory="#variables.strSmallDirectory#" mode="777">
		</cfif>
		
		<!--- Upload and Shrink --->
		<cffile action="upload" fileField="uploadFile" destination="#variables.strSmallDirectory#" nameConflict="overwrite" result="variables.stuUploadDetails">
		
		<cfif listFindNoCase(variables.strLstFiles,variables.stuUploadDetails.serverFileExt)>
			<!--- resize --->
			<cfimage action="resize" source="#variables.strSmallDirectory##variables.stuUploadDetails.serverFile#" width="#variables.intPercentDecrease#%" height="#variables.intPercentDecrease#%" destination="#variables.strSmallDirectory##variables.stuUploadDetails.serverFile#" overwrite="yes">
			<!--- Create Zip file --->
			<cfzip file="#variables.strZipDirectory##strMyId#.zip" action="zip" source="#variables.strSmallDirectory#" filter="#variables.strLstFilters#" />
		<cfelse>
			<!--- Not a supported image --->
			<cfset stuMsg.bError		=	true>
			<cfset stuMsg.strMsg		=	"Not an image">
		</cfif>
	<cfelse>
		<!--- No file provided --->
		<cfset stuMsg.bError		=	true>
		<cfset stuMsg.strMsg		=	"Missing Photo">
	</cfif>
<cfcatch>
	<!--- Unkown Error --->
	<cfset stuMsg.bError		=	true>
	<cfset stuMsg.strMsg		=	"Upload Error">
	<cfset stuMsg.details		=	cfcatch.Message>
</cfcatch>
</cftry>
<cfoutput>#serializeJSON(stuMsg)#</cfoutput><!--- Return json message structure --->