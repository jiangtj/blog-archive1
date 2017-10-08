<script type="text/javascript" src="{{ url_for(theme.js) }}/src/jquery-stars.js?v={{ theme.version }}"></script>
<script type="text/javascript">
jQuery('body').jstars({
	image_path: '{{ url_for(theme.images) }}',
	image: 'candy-cane-stars.png',
	style: 'white',
	width: 34,
	height: 34,
	delay: 700,
	frequency: 5
});
</script>