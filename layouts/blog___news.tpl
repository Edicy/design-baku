<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
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
       <div id="content-inner">
        {% if tags %}
            <div class="blog tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
       {% addbutton %} {% for article in articles %}
       <h1><table><tr><td class="blog-date">{{ article.created_at | format_date:"%d. %b" }}</td><td><a href="{{article.url}}">{{article.title}}</a></td></tr></table></h1>
       <div class="blog-excerpt clearfix">
        {{article.excerpt}}
         <a href="{{article.url}}" class="read_more">{{ "read_more" | lc }}</a> | <a href="{{article.url}}#comments" class="read_more">{{ "comments_for_count" | lc }}: {{article.comments_count}}</a>
       </div>{% endfor %}
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

