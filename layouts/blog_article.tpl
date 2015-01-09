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
       <h1><table><tr><td class="blog-date">{{article.created_at | format_date:"%d. %b"}}</td><td>{% editable article.title %}</td></tr></table></h1>
       <div class="blog-excerpt clearfix" data-search-indexing-allowed="true">
        {% editable article.excerpt %}
       </div>
       <div class="blog-body clearfix" data-search-indexing-allowed="true">
        {% editable article.body %}
       </div>
       {% if editmode %}
            <div class="article-tags">
                <div class="article-tag-icon"></div>
                {% editable article.tags %}
            </div>
          {% else %}
            {% unless article.tags == empty %}
                <div class="cfx article-tags">
                    <div class="article-tag-icon"></div>
                    {% for tag in article.tags %}
                        <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </div>
            {% endunless %}
       {% endif %}
       {% if article.comments %}
       <h2>{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>
</h2>
       <table id="comments-table">{% for comment in article.comments %}
        <tr class="{% if forloop.last %}borderless {% endif %}edy-site-blog-comment">
         <td class="comment-author">
          <span>{{comment.author}}</span> {% removebutton %}<br />
          {{comment.created_at | format_date:"%d.%B %Y"}}
         </td>
         <td class="comment-body">
          {{comment.body}}
         </td>
        </tr>{% endfor %}
       </table>
       {% endif %}
       <div id="comment-form">
       {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
         <a name="comments"></a>
         <h2>{{"add_a_comment" | lc }}</h2>
         <table>
          <tr>
           <td class="comment-label">
            {{"name" | lc }}:
           </td>
           <td>
            <input type="text" class="gradient-textbox" name="comment[author]" value="{{comment.author}}" />
           </td>
          </tr>
          <tr>
           <td class="comment-label">
            {{"email" | lc}}:
           </td>
           <td>
            <input type="text" class="gradient-textbox" name="comment[author_email]" value="{{comment.author_email}}" />
           </td>
          </tr>
          <tr>
           <td class="comment-label">
            {{"comment" | lc }}:
           </td>
           <td>
            <textarea class="gradient-textarea" name="comment[body]">{{comment.body}}</textarea>
           </td>
          </tr>
          <tr>
           <td class="comment-label"></td>
           <td>
            <input type="submit" class="comment-submit" value="{{"submit"|lc}}" />
           </td>
          </tr>
         </table>
        {% endcommentform %}
       </div>
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
