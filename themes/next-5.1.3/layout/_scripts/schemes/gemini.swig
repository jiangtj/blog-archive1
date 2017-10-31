{%
  set scripts = [
    'src/affix.js',
    'src/schemes/pisces.js'
  ]
%}

{% for script in scripts %}
  <script type="text/javascript" src="{{ url_for_lang(theme.js) }}/{{ script }}?v={{ theme.version }}"></script>
{% endfor %}
