<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
	<head>
  {% include "SiteHeader" %}
	</head>
	<body>
  <div id="wrap">
   <div id="header" class="clearfix">
    <div class="innerwrap">
     {% include "Langmenu" %}
     <div id="logo"{% unless editmode %}{% unless site.has_many_languages? %} class="languageless"{% endunless %}{% endunless %} class="clearfix">
      {% editable site.header %}
     </div>
     {% include "Mainmenu" %}
    </div>
   </div>	
   <div id="content" class="clearfix">
    <div class="innerwrap">
     <div id="content-column-left">
      {% include "Submenu" %}
      <div id="content-inner" class="clearfix" data-search-indexing-allowed="true">
       {% content %}
      </div>
      <div id="footer">
       <div class="footer-inner clearfix">
        {% xcontent name="footer" %}
       </div>
       <div id="edicy">
        {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
       </div>
      </div>
     </div>
     <div id="content-column-right">
      {% include "Search" %}
       {% include "Thirdmenu" %}
     </div>
    </div>
   </div>
  </div>
  {% include "JS" %}
	</body>
</html>
