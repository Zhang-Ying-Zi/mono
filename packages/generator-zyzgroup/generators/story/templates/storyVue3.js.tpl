// YourComponent.stories.js

import YourComponent from "./YourComponent.vue";

export default {
  title: "YourComponent",
  component: YourComponent,
};

const Template = (args) => ({
  components: { YourComponent },
  setup() {
    return { args };
  },
  template: '<YourComponent v-bind="args"/>',
});

export const FirstStory = Template.bind({});

FirstStory.args = {
};
