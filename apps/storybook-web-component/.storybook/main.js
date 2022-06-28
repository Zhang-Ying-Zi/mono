module.exports = {
  stories: ["../src/**/*.stories.mdx", "../src/**/*.stories.@(js|jsx|ts|tsx)"],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions",
  ],
  framework: "@storybook/web-components",
  core: {
    builder: "@storybook/builder-webpack5",
  },
  refs: {
    react: {
      title: "React",
      url: "http://localhost:6007",
      expanded: false,
    },
    angular: {
      title: "Angular",
      url: "http://localhost:6008",
      expanded: false,
    },
    vue: {
      title: "Vue",
      url: "http://localhost:6009",
      expanded: false,
    },
  },
};
