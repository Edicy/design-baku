    <div id="mainmenu">
      <ul>
        {% unless site.root_item.hidden? %}<li><a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>{% endunless %}
        {% for item in site.visible_menuitems %}
        <li><a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{item.title}}</a></li>
        {% endfor %}
        {% if site.hidden_menuitems.size > 0 %}
            <li class="vg-menu-btn">{% menubtn site.hidden_menuitems %}</li>
        {% endif %}
        {% if editmode %}<li class="vg-menu-btn">{% menuadd %}</li>{% endif %}
      </ul>
    </div>
