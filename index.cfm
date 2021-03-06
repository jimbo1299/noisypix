<cfsilent>
	<cfapplication name="imgUpload" sessionmanagement="true" sessiontimeout="#createTimeSpan(0,0,30,0)#">
	<!--- Session vars control the directory name, so we can keep all client files together --->
	<cfset variables.strMyId		=	replace(createUUID(),"-","","all")>
	<!--- I check the cgi.http_host and decide if we should be using local relative file paths or LIVE (aws S3) file paths --->
	<cfset application.stuHeaders.strJquery		= "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
	<cfset application.stuHeaders.strJsFiledrop	= "http://s3.amazonaws.com/noisyJS/jquery.filedrop.js">
	<cfset application.stuHeaders.strBootstrap	= "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css">
</cfsilent>
<cfif structKeyExists(url,"goold") OR structKeyExists(cookie,"goold")>
	<cfcookie name="goold" value="true" />
	<cfinclude template="html4version.cfm" />
	<cfabort />
</cfif>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Free online photo compress, optimize and free photo shrinking. Minimize and shrink your files online. Save storage space now.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

	    <meta name="description" content="Noisy Photos Free Image compression software utility, allow us to compress, optimize, resize and shrink your jpeg, jpg, bmp or gif photos to email or for a more backup friendly useable, smaller file size." />
	    <meta name="keywords" content="Photo, Noisy Cloud, Cloud, Noisy, Cloud Computing, compression, free, online, image, shrinker, jpeg, gif, jpg, png, bmp, photo, resize, multiple file, files, minimize, email" />
		<meta name="author" content="Noisy Cloud">

		<!--- CSS --->
		<link rel="stylesheet" type="text/css" href="noisyPix.css" />
		<cfoutput><link href="#application.stuHeaders.strBootstrap#" rel="stylesheet"></cfoutput>
		<style>
			body {
				padding-top: 20px; /* 20px to make the container go all the way to the bottom of the topbar */
			}
		</style>
		
		<!--- JS --->
		<cfoutput>
			<script type="text/javascript">
				mySession	= {
					// This will be referenced by js posting ajax
					strMyId	: "#variables.strMyId#"
				};
			</script>
			<script src="#application.stuHeaders.strJquery#"></script>
			<script src="#application.stuHeaders.strJsFiledrop#"></script>
	        <script src="noisyPix.js"></script>
		</cfoutput>
	</head>

	<body>
		<div class="container">
			<!--- Main hero header --->
			<div class="row">
				<div class="span12">
					<div id="bannerImg">
						<h1>Noisy Pix - Free Online Photo Compress, Optimize And Shrink</h1>
					</div>
				</div>
			</div><!-- /row -->

			<div class="row">
				<div class="span12">
					<div id="socialMedia">
						<g:plusone annotation="inline"></g:plusone>
					</div>
				</div>
			</div><!-- /row -->

			<!--- Intro paragraph --->
			<div class="row">
				<div class="span12">
					<div class="inner">
						<p>
							Noisy Pix is a <strong>freeware</strong> utility that allows you to <strong>compress</strong> and optimize large images or photos that take up your storage space, into small manageable files. 
							You can upload and <strong>compress</strong> as many gifs, jpegs, jpgs or photos as you want and the <strong>free</strong> image shrinker will compress, shrink, resize and return them to 
							you in one convenient zip file. To get started simply select your photo using the above file selector and press submit. Noisy Pix Shrinker works great for saving space, 
							<strong>emails</strong> and <strong>backups</strong> of your family photos.
						</p>
					</div>
				</div>
			</div><!-- /row -->
		
			<!--- Dropbox --->
			<div class="row">
				<div class="span12">
					<div id="dropbox">
						<span id="message" class="message_big">Drop images here to upload.</span>
						<span id="photoHolder" style="display: none;"></span>
					</div>
				</div>
			</div><!-- /row -->
		
			<!--- Download Popup Alert Box --->
			<div class="row">
				<div class="span12">
					<div id="downloadBox" class="alert alert-info alertBoxes">
						<cfoutput>
			            	<a href="files/#variables.strMyId#.zip">
				            	<strong>Download - </strong> Download zip file of compressed images.
			            	</a>
		            	</cfoutput>
		          </div>
				</div>
			</div><!-- /row -->
			
			<!--- Error Alert Box --->
			<div class="row">
				<div class="span12">
					<div id="errorBox" class="alert alert-block alert-error alertBoxes">
		            	<strong>Error - </strong><span id="errorText"></span>
		          </div>
				</div>
			</div><!-- /row -->
		
			<!--- Blurb --->
			<div class="row">
				<div class="span4">
					<div class="inner">
						<h2>Compress For Email</h2>
						<p>Noisy Pix works great for emailing your photos to your friends. Large photos slow down transmission time, consume bandwidth and can annoy the recipient. To save time and internet costs simply use Noisy Pix photo compression tool to shrink your photos before emailing.</p>
					</div>
				</div>
				<div class="span4">
					<div class="inner">
						<h2>Save Storage Space</h2>
						<p>Modern digital cameras and SLR cameras can take very large high quality photos. Often that quality is not needed for casual browsing and storing old family photos. Use Noisy pix to quickly and simply compress your photos and images for cheap easy backup.</p>
					</div>	
				</div>
				<div class="span4">
					<div class="inner">
						<h2>Free Online Tool T&C</h2>
						<p>
							Noisy Pix is a product of <a href="http://www.noisycloud.co.uk" onclick="return ! window.open(this.href);">Noisy Cloud</a>. 
							By using this free service you agree NOT to use this service for any activities in any way illegal in 
							the country of use, the USA or UK. You will not	use this tool for any material which you are 
							not the copyright holder. Noisy Cloud are not responsable for the your content which is hosted <strong>unsecure</strong>
							and temporarily.
						</p>
					</div>
				</div>
			</div><!-- /row -->
		
			<hr>
			
			<footer>
			  <a href="http://www.noisycloud.co.uk">&copy; Noisy Cloud Solutions <cfoutput>#year(now())#</cfoutput></a>
			</footer>
		
		</div><!-- /container -->
	</body>
</html>
