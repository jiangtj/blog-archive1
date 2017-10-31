{% if theme.save_scroll %}
  <script type="text/javascript" src="{{ url_for_lang(theme.js) }}/src/js.cookie.js?v={{ theme.version }}"></script>
  <script type="text/javascript" src="{{ url_for_lang(theme.js) }}/src/scroll-cookie.js?v={{ theme.version }}"></script>
{% endif %}
