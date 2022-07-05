// .storybook/main.js

module.exports = {
  stories: [
    "../src/**/*.stories.mdx", 
    "../src/**/*.stories.@(js|jsx|ts|tsx)",
    {
      directory: '../packages/stories',
      titlePrefix: 'MyComponents',
      files: '*.stories.*',
    },
    '../packages/MyStories',
  ],
  features: {
    // Configures Storybook to load stories on demand, rather than during boot up.
    // storyStoreV7: true,
  },
  addons: [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    "@storybook/addon-interactions",
  ],
  babel: async (options) => ({
    // Update your babel configuration here
    ...options,
  }),
  webpackFinal: async (config, { configType }) => {
    // Make whatever fine-grained changes you need
    // Return the altered config
    return config;
  },
  // configType : 'DEVELOPMENT' | 'PRODUCTION'
  // async viteFinal(config, { configType }) {
  //     // customize the Vite config here
  //     return {
  //       ...config,
  //       // Use the same "resolve" configuration as your app
  //       // resolve: (await import('../vite.config.js')).default.resolve,
  //       resolve: {
  //         alias: [
  //           {
  //             find: "@zyzgroup/core",
  //             replacement: path.resolve(
  //               __dirname,
  //               "../../../packages/zyzgroup-core/"
  //             ),
  //           },
  //           {
  //             find: "@zyzgroup/map",
  //             replacement: path.resolve(
  //               __dirname,
  //               "../../../packages/zyzgroup-map/"
  //             ),
  //           },
  //         ],
  //       },
  //       // Add dependencies to pre-optimization
  //       optimizeDeps: {
  //         include: ['storybook-dark-mode'],
  //       },
  //     };
  //   },
  // };
  // @storybook/react
  framework: "@storybook/web-components",
  // @storybook/builder-vite
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
