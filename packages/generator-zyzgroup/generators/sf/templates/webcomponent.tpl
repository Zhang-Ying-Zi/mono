import html from './template.html';
import css from './styles.css';

/* External stylesheet */
/*
// to hide a web component before it’s available — or "defined"
:not(:defined) {
  display: none;
}
.high-match::part(zname) {
  color: blue;
}
.medium-match::part(zname) {
  color: navy;
}
.low-match::part(zname) {
  color: slategray;
}
*/

/*
<template id="my-paragraph">
  <style>
    :host {
      width: calc(50% - 1em);
    }
    :host(.high) {
      border: 2px solid blue;
    }
    :host(:last-child) {
      border: 1px solid slategray;
    }
    :host(:hover) {
      border: 5px solid purple;
    }
    p {
      color: white;
      background-color: #666;
      padding: 5px;
    }
    :host(.special-custom-element) {
      font-weight: bold;
    }
    ::slotted(img) {
      width: 100%;
      max-width: 300px;
      height: auto;
      margin: 0 1em 0 0;
    }
    ::slotted(*) {}
  </style>
  <p><slot name="my-text">My default text</slot></p>
  <h2 part="zname">
    <slot name="zombie-name">Zombie Bob</slot>
  </h2>
</template>
*/

class <%= className %> extends HTMLElement {
  constructor() {
    // Always call super first in constructor
    super();

    // Create a shadow root
    const shadow = this.attachShadow({mode: 'open'});

    // template and slot
    const template = document.createElement('template');
    // content: "\f00d" /* Will render as "00d" without escaping */
    template.innerHTML = `
      <style>
        ${css.replace(/\\/g, '\\\\')}
      </style>
      ${html}
      <p><slot name="my-text">My default text</slot></p>
    `;
    shadow.appendChild(template.content.cloneNode(true));

    // template and slot
    const template2 = document.getElementById('my-paragraph');
    shadow.appendChild(template2.content.cloneNode(true));

    // append child
    const wrapper = document.createElement('span');
    wrapper.setAttribute('class', 'wrapper');
    const info = document.createElement('span');
    info.setAttribute('class', 'info');
    const text = this.getAttribute('data-text');
    info.textContent = text;
    wrapper.appendChild(info);
    shadow.appendChild(wrapper);

    // Create some CSS to apply to the shadow dom
    const style = document.createElement('style');
    console.log(style.isConnected);
    style.textContent = `
      .wrapper {
        position: relative;
      }
    `;
    shadow.appendChild(style);
    
    // 因为<link> 元素不会打断 shadow root 的绘制, 因此在加载样式表时可能会出现未添加样式内容（FOUC），导致闪烁。
    const linkElem = document.createElement('link');
    linkElem.setAttribute('rel', 'stylesheet');
    linkElem.setAttribute('href', 'style.css');
    shadow.appendChild(linkElem);
  }

  // 当 custom element首次被插入文档DOM时，被调用
  connectedCallback() {
    this.addEventListener("click", this.onClick);
  }

  // 当 custom element从文档DOM中删除时，被调用
  disconnectedCallback() {
    this.removeEventListener("click", this.onClick);
  }

  // 当 custom element被移动到新的文档时，被调用
  adoptedCallback() {
  }

  static get observedAttributes() {
    return ["attribute-name"];
  }

  // 当 custom element增加、删除、修改自身属性时，被调用
  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "disabled") {
      this.shadowRoot.getElementById("button").disabled = newVal === "true";
    }
  }

  set disabled(bool) {
    this.setAttribute("disabled", bool.toString());
  }
  get disabled() {
    return this.getAttribute("disabled") === "true";
  }
  
  onClick() {
    console.log("onClick handled");

    // const clickEvent = new CustomEvent("clicked", {
    //   bubbles: true,
    //   cancelable: false,
    //   composed: true
    // });
    // this.dispatchEvent(clickEvent);

    // 不加(), eval会返回undefined
    // const onClicked = eval("(" + this.getAttribute('onClick') + ")");
    // if (onClicked) onClicked(e);
  }

}

customElements.define('<%= fileName %>', <%= className %>);