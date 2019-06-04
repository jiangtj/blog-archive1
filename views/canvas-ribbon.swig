{% if theme.canvas_ribbon.enable %}
  {% set canvas_ribbon_uri = url_for(theme.canvas_ribbon.url||'//cdn.jsdelivr.net/gh/theme-next/theme-next-canvas-ribbon@1/canvas-ribbon.js') %}
  <script id="ribbon" size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}" zIndex="{{theme.canvas_ribbon.zIndex }}" src="{{ canvas_ribbon_uri }}"></script>
{% endif %}