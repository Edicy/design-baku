    <div id="mainmenu">
      <p>
        {% unless site.root_item.hidden? %}<a href="{{site.root_item.url}}"{% if site.root_item.selected? %} class="active"{% endif %}>{{site.root_item.title}}</a>{% endunless %}
        {% for item in site.visible_menuitems %}
        <a href="{{item.url}}"{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{item.title}}</a>
        {% endfor %}
        {% menubtn site.hidden_menuitems %}
        {% if editmode %}{% menuadd %}{% endif %}
      </p>
    </div>
