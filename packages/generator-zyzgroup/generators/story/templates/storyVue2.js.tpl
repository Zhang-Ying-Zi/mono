import <%= storyComponentName %> from "./<%= storyComponentName %>.vue";

export default {
  title: "<%= storyComponentName %>",
  component: <%= storyComponentName %>,
  argTypes: {
    backgroundColor: { control: "color" },
    size: {
      control: {
        type: "select",
        options: ["small", "medium", "large"],
      },
    },
    variant: {
      control: {
        type: "radio",
        options: ["primary", "secondary"],
      },
    },
  },
  args: {},
  parameters: {},
  decorators: [
    () => ({ template: '<div style="margin: 2em;"><story/></div>' }),
  ],
};


const Template = (args, { argTypes }) => ({
  components: { <%= storyComponentName %> },
  props: Object.keys(argTypes),
  template: '<<%= storyComponentName %> v-bind="$props" v-on="$props"/>',
});

export const FirstStory = Template.bind({});
FirstStory.args = {
  /* 👇 The args you need here will depend on your component */
};
