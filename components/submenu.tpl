{% for item in site.menuitems %}{% if item.selected? %}
{% if editmode %}
<div id="submenu" class="clearfix">
  <ul>{% for level2 in item.visible_children %}
    <li{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated"{% endunless %}>
      <a href="{{level2.url}}"{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %}>{{level2.title}}</a>
    </li>{% endfor %}
      <li>{% menubtn item.hidden_children %}</li>    
      <li>{% menuadd parent="item" %}</li>
    </ul>
      </div>
{% else %}
      {% if item.children? %}
      <div id="submenu" class="clearfix">
  <ul>{% for level2 in item.all_children %}
    <li{% if level2.selected? %} class="active"{% endif %}>
      <a href="{{level2.url}}">{{level2.title}}</a>
    </li>{% endfor %}
    </ul>
      </div>
      {% endif %}
{% endif %}
{% endif %}{% endfor %}
<!-- Third menu -->
{% if editmode %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      {% if item.children? %}
        {% for l2 in item.children %}
          {% if l2.selected? %}
            <ul id="mobile-thirdmenu" class="clearfix">
              {% for l3 in l2.visible_children %}
                <li{% if l3.selected? %} class="active"{% endif %}>
                  <a href="{{ l3.url }}"{% unless l3.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ l3.title }}</a>
                </li>
              {% endfor %}
              <li>{% menubtn l2.hidden_children %}</li>
              <li>{% menuadd parent="l2" %}</li>
            </ul>
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}
{% else %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      {% if item.children? %}
        {% for l2 in item.children %}
          {% if l2.selected? %}
            {% if l2.children? %}
            <ul id="mobile-thirdmenu" class="clearfix">
               {% for l3 in l2.children %}
                 <li{% if l3.selected? %} class="active"{% endif %}><a href="{{ l3.url }}">{{ l3.title }}</a></li>
               {% endfor %}
              </ul>
            {% endif %}
          {% endif %}
        {% endfor %}
      {% endif %}
    {% endif %}
  {% endfor %}
{% endif %}
<!-- //Third menu -->