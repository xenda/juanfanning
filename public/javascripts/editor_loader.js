$(document).ready(function() {
		$('textarea.tinymce').tinymce({

			// General options
			theme : "advanced",

			// Example content CSS (should be your site CSS)
			//content_css : "css/content.css",
      // General options

       mode : "textareas",
       language: "es",
       // 
       plugins : "autosave,safari,pagebreak,style,table,advhr,advimage,advlink,iespell,inlinepopups,preview,media,print,contextmenu,paste,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras",

       // Theme options
       theme_advanced_buttons1 :
       "pastetext,pasteword,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontsizeselect,formatselect",
       theme_advanced_buttons2 : "bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,image,media,code,|,sub,sup,|,table",
       theme_advanced_buttons3 : "",
       theme_advanced_buttons4 : "",
       theme_advanced_toolbar_location : "top",
       theme_advanced_toolbar_align : "left",
       theme_advanced_statusbar_location : "bottom",
       theme_advanced_resizing : true,
       theme_advanced_resizing_min_height : 640,
       height : "340",
       width: "540",
       theme_advanced_resizing_max_width : 250,
       document_base_url : "http://juanfanning.com/",
       relative_urls : false,
       relative_path: false,
       media_strict : false,

       extended_valid_elements : "object[classid|codebase|width|height|align],param[name|value],embed[quality|type|pluginspage|width|height|src|align|wmode,allowscriptaccess,allowfullscreen],iframe[src|width|height|frameborder|marginheight|marginwidth]",

		});
	});