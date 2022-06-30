// YourComponent.stories.js

import YourComponent from "./YourComponent.vue";

//👇 This default export determines where your story goes in the story list
export default {
  title: "YourComponent",
  component: YourComponent,
};

//👇 We create a “template” of how args map to rendering
const Template = (args) => ({
  components: { YourComponent },
  setup() {
    //👇 The args will now be passed down to the template
    return { args };
  },
  template: '<YourComponent v-bind="args"/>',
});

export const FirstStory = Template.bind({});

FirstStory.args = {
  /* 👇 The args you need here will depend on your component */
};
