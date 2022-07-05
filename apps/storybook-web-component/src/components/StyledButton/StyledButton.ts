export class StyledButton extends HTMLElement {
  constructor() {
    super();

    const shadow = this.attachShadow({ mode: 'open' });

    // const linkElem = document.createElement('link');
    // linkElem.setAttribute('rel', 'stylesheet');
    // linkElem.setAttribute('href', './styled-button.css');
    // shadow.appendChild(linkElem);

    const template = document.createElement('template');
    template.innerHTML = `
      <style>
        /* General button style (reset) */
        .btn {
          font-family: inherit;
          font-size: inherit;
          cursor: pointer;
          padding: 15px 30px;
          display: inline-block;
          margin: 15px 30px;
          text-transform: uppercase;
          letter-spacing: 1px;
          font-weight: 700;
          outline: none;
          position: relative;
          -webkit-transition: all 0.3s;
          -moz-transition: all 0.3s;
          transition: all 0.3s;

          border: none;
          color: inherit;
          background: none;
          border: 3px solid #fff;
          color: #fff;
        }

        .btn:after {
          content: '';
          position: absolute;
          z-index: -1;
          -webkit-transition: all 0.3s;
          -moz-transition: all 0.3s;
          transition: all 0.3s;
        }

        .btn-type1:hover,
        .btn-type1:active {
          color: #333;
          background: #fff;
        }

        .btn-type2:after {
          width: 100%;
          height: 0;
          top: 0;
          left: 0;
          background: #fff;
        }
        .btn-type2:hover,
        .btn-type2:active {
          color: #333;
        }
        .btn-type2:hover:after,
        .btn-type2:active:after {
          height: 100%;
        }


        .btn-type3:after {
          width: 0%;
          height: 100%;
          top: 0;
          left: 0;
          background: #fff;
        }
        .btn-type3:hover,
        .btn-type3:active {
          color: #333;
        }
        .btn-type3:hover:after,
        .btn-type3:active:after {
          width: 100%;
        }

        .btn-type4 {
          overflow: hidden;
        }
        .btn-type4:after {
          width: 0;
          height: 103%;
          top: 50%;
          left: 50%;
          background: #fff;
          opacity: 0;
          -webkit-transform: translateX(-50%) translateY(-50%);
          -moz-transform: translateX(-50%) translateY(-50%);
          -ms-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
        }
        .btn-type4:hover,
        .btn-type4:active {
          color: #333;
        }
        .btn-type4:hover:after {
          width: 90%;
          opacity: 1;
        }
        .btn-type4:active:after {
          width: 101%;
          opacity: 1;
        }

        .btn-type5 {
          overflow: hidden;
        }
        .btn-type5:after {
          width: 100%;
          height: 0;
          top: 50%;
          left: 50%;
          background: #fff;
          opacity: 0;
          -webkit-transform: translateX(-50%) translateY(-50%) rotate(45deg);
          -moz-transform: translateX(-50%) translateY(-50%) rotate(45deg);
          -ms-transform: translateX(-50%) translateY(-50%) rotate(45deg);
          transform: translateX(-50%) translateY(-50%) rotate(45deg);
        }
        .btn-type5:hover,
        .btn-type5:active {
          color: #333;
        }
        .btn-type5:hover:after {
          height: 260%;
          opacity: 1;
        }
        .btn-type5:active:after {
          height: 400%;
          opacity: 1;
        }

        .btn-type6 {
          overflow: hidden;
        }
        .btn-type6:after {
          width: 101%;
          height: 0;
          top: 50%;
          left: 50%;
          background: #fff;
          opacity: 0;
          -webkit-transform: translateX(-50%) translateY(-50%);
          -moz-transform: translateX(-50%) translateY(-50%);
          -ms-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
        }
        .btn-type6:hover,
        .btn-type6:active {
          color: #333;
        }
        .btn-type6:hover:after {
          height: 75%;
          opacity: 1;
        }
        .btn-type6:active:after {
          height: 130%;
          opacity: 1;
        }


      </style>
      <button class="${"btn " + this.getAttribute("class")}"><slot name='text'>${this.innerHTML || '默认按钮'}</slot></button>
    `;
    shadow.appendChild(template.content.cloneNode(true));
  }

  connectedCallback() {
    // this.addEventListener("click", this.onClick);

    this.shadowRoot.querySelector('button.btn').addEventListener("click", this.onClick.bind(this));
  }

  disconnectedCallback() {
    // this.removeEventListener("click", this.onClick);
  }

  onClick(e) {
    console.log("web component styled-button clicked handled", e);

    // const clickEvent = new CustomEvent("clicked", {
    //   bubbles: true,
    //   cancelable: true,
    //   composed: true
    // });
    // this.dispatchEvent(clickEvent);

    // 不加(), eval会返回undefined
    const onClicked = eval("(" + this.getAttribute('onClick') + ")");
    // console.log(onClicked);
    if (onClicked) onClicked(e);

  }

}
customElements.define("styled-button", StyledButton);



