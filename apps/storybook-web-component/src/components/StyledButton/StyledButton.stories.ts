import "./StyledButton";

export default {
  title: "COMPONENTS/StyledButton",
  parameters: {
    // actions: {
    //   handles: ['click'], // ['mouseover', 'click .btn']
    // },
    backgrounds: {
      default: 'green',
      values: [
        { name: 'blue', value: '#0e83cd' },
        { name: 'red', value: '#f06060' },
        { name: 'yellow', value: '#fcd04b' },
        { name: 'green', value: '#2ecc71' },
      ],
    },
  },
  argTypes: {
    // onClick: { action: 'clicked' },
    classes: {
      control: { type: 'select' },
      options: ['btn-type1', 'btn-type2', 'btn-type3', 'btn-type4', 'btn-type5', 'btn-type6'],
    },
  },
  args: {
    onClick: (e) => {
      console.log("stories: ", e);
    },
  },
};

const Template = (args, globals) => {
  console.log(args, globals);
  return `<styled-button class=${args.classes} onClick='${args.onClick}'>${args.title}</styled-button>`;
}


export const Type1 = Template.bind({});
Type1.args = {
  classes: 'btn-type1',
  title: 'btn-type1',
}

export const Type2 = Template.bind({});
Type2.args = {
  classes: 'btn-type2',
  title: 'btn-type2',
}


export const Type3 = Template.bind({});
Type3.args = {
  classes: 'btn-type3',
  title: 'btn-type3',
}


export const Type4 = Template.bind({});
Type4.args = {
  classes: 'btn-type4',
  title: 'btn-type4',
}


export const Type5 = Template.bind({});
Type5.args = {
  classes: 'btn-type5',
  title: 'btn-type5',
}


export const Type6 = Template.bind({});
Type6.args = {
  classes: 'btn-type6',
  title: 'btn-type6',
}