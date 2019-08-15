/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {

  injects.postMeta.raw('post-meta-i18n', `
  {%- if post.i18n %}
    <span class="post-meta-item">
      <span class="post-meta-item-icon">
        <i class="fa fa-globe"></i>
      </span>
      <span class="post-meta-item-text">{{ __('post.i18n') }}</span>
      {%- for name,link in post.i18n %}
        {{ i18n_post_meta(name, link, post.path) }}
      {%- endfor %}
    </span>
  {%- endif %}
  `);

});

hexo.extend.helper.register('i18n_post_meta', function(name, link, path) {
  link = this.url_for(link).replace('index.html', '');
  path = this.url_for(path).replace('index.html', '');
  let postMeta = `<span>${name}</span>`;
  if (link !== path) {
    postMeta = `<a href="${link}">${postMeta}</a>`;
  }
  return postMeta;
});
