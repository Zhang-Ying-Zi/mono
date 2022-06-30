const path = require("path");

module.exports = {
  stories: ["../src/**/*.stories.mdx", "../src/**/*.stories.@(js|jsx|ts|tsx)"],
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions",
    "@storybook/preset-create-react-app",
  ],
  framework: "@storybook/react",
  core: {
    builder: "@storybook/builder-webpack5",
  },
  // async viteFinal(config, { configType }) {
  //   // customize the Vite config here
  //   return {
  //     ...config,
  //     resolve: {
  //       alias: [
  //         {
  //           find: "@zyzgroup/core",
  //           replacement: path.resolve(
  //             __dirname,
  //             "../../../packages/zyzgroup-core/"
  //           ),
  //         },
  //         {
  //           find: "@zyzgroup/map",
  //           replacement: path.resolve(
  //             __dirname,
  //             "../../../packages/zyzgroup-map/"
  //           ),
  //         },
  //       ],
  //     },
  //   };
  // },
};
