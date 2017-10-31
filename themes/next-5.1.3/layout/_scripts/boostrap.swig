{%
  set boot_scripts = [
    'src/bootstrap.js'
  ]
%}

{% for bs in boot_scripts %}
  <script type="text/javascript" src="{{ url_for_lang(theme.js) }}/{{ bs }}?v={{ theme.version }}"></script>
{% endfor %}
