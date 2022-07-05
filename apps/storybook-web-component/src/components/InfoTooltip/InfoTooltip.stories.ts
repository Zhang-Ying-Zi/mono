import "./InfoTooltip";

const Template = ({ text }) =>
  `<info-tooltip><p slot="content">${text}</p></info-tooltip>`;

export default {
  title: "COMPONENTS/InfoTooltip",
  decorators: [
    (story) => `<div style="margin: 10em">${story()}</div>`
  ],
  argTypes: {
    text: {
      control: { type: "text" },
    },
  },
};

export const Empty = Template.bind({});
Empty.args = {
  text: "",
};

export const SingleLine = Template.bind({});
SingleLine.args = {
  text: "Hello World!",
};

export const MultiLine = Template.bind({});
MultiLine.args = {
  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
};