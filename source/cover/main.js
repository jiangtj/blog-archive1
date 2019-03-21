
customElements.define('info-card',
    class InfoCard extends HTMLElement {
        constructor() {
            super();

            //创建<div class="item"><a href="https://jiangtj.gitlab.io/me"><i class="fas fa-heart"></i>About Me</a></div>

            const iItem = document.createElement('i');
            iItem.className = this.getAttribute('icon');

            const aItem = document.createElement('a');
            aItem.setAttribute('href', this.getAttribute('href'))
            aItem.appendChild(iItem);
            aItem.append(this.getAttribute('text'));

            const divItem = document.createElement('div');
            divItem.className = 'item';
            divItem.appendChild(aItem);

            const shadowRoot = this.attachShadow({ mode: 'closed' });
            shadowRoot.appendChild(divItem);

        }
    }
)

customElements.define('my-paragraph',
  class extends HTMLElement {
    constructor() {
      super();

      const template = document.getElementById('my-paragraph');
      const templateContent = template.content;

      this.attachShadow({mode: 'open'}).appendChild(
        templateContent.cloneNode(true)
      );
    }
  }
);
