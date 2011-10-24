{% if editmode %}
<div id="langmenu" class="clearfix">
      <ul>
        {% for language in site.languages %}<li{% if language.selected? %} class="active"{% endif %}><a href="{{language.url}}">{{language.title}}</a></li>{% endfor %}
        <li>{% languageadd %}</li>
      </ul>
     </div>
{% else %}
        {% if site.has_many_languages? %}
        <div id="langmenu" class="clearfix">
      <ul>
        {% for language in site.languages %}<li{% if language.selected? %} class="active"{% endif %}><a href="{{language.url}}">{{language.title}}</a></li>{% endfor %}
      </ul>
     </div>
        {% endif %}
{% endif %}
