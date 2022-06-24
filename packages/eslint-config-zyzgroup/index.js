module.exports = {
  extends: ["eslint:recommended"],
  env: {
    browser: true,
    node: true,
    es6: true, // 启用除了 modules 以外的所有 ECMAScript 6 特性（该选项会自动设置 ecmaVersion 解析器选项为 6）
  },
  parserOptions: {
    // ecmaVersion: 2015（同 6）| 2016（同 7）| 2017（同 8）| 2018（同 9）| 2019 (同 10) // 仅支持ES6语法
    // sourceType: "script" | "module",
    // ecmaFeatures: {
    //   globalReturn: false, //允许在全局作用域下使用 return 语句
    //   impliedStrict: false, //启用全局 strict mode (如果 ecmaVersion 是 5 或更高)
    //   jsx: true, //启用 JSX
    //   experimentalObjectRestSpread: false, //启用实验性的 object rest/spread properties 支持。
    // },
  },
  settings: {
    //   react: {
    //     version: "detect", // React version. "detect" automatically picks the version you have installed.
    //   },
  },
  ignorePatterns: ["**/*.test.js"],
  plugins: [],
  // 解决规则冲突
  rules: {
    "no-unused-vars": "warn",
  },
  overrides: [
    //   // 处理 JS 文件
    //   {
    //     files: ["**/*.{js,jsx}"], // 只处理 js 和 jsx 文件
    //     parser: "@babel/eslint-parser", // 使用 babel 来解析 js 文件
    //     parserOptions: {
    //       sourceType: "module", // 支持 import/export
    //       allowImportExportEverywhere: false,
    //       ecmaFeatures: {
    //         globalReturn: false,
    //       },
    //       babelOptions: {
    //         rootMode: "upward",
    //       },
    //     },
    //   },
    //   // 处理 TS 文件
    //   {
    //     files: ["**/*.{ts,tsx}"], // 只处理 ts 和 js 文件
    //     excludedFiles: [".eslintrc.js"], // 这里禁用了 .eslintrc.js 的类型检查
    //     parser: "@typescript-eslint/parser", // 能看懂 TypeScript
    //     parserOptions: {
    //       tsconfigRootDir: __dirname,
    //       createDefaultProgram: true,
    //       project: ["./tsconfig.json"], // 告诉 eslint：tsconfig 在哪
    //     },
    //     extends: [
    //       // typescript-eslint 的推荐规则，只是这些最佳规则都是针对 TS 的
    //       "plugin:@typescript-eslint/recommended",
    //       // tsconfig.json 里 Type Checking 的推荐规则
    //       "plugin:@typescript-eslint/recommended-requiring-type-checking",
    //     ],
    //     plugins: [
    //       // 使用 typescript x eslint 的插件
    //       "@typescript-eslint",
    //     ],
    //   },
    //   // 处理 vue 文件
    //   {
    //     files: ["**/*.vue"], // 只处理 vue 文件
    //     extends: [
    //       // "plugin:vue/vue3-recommended",
    //       // "plugin:vue/recommended", // Use this if you are using Vue.js 2.x.
    //       // "plugin:prettier/recommended",
    //     ],
    //   },
  ],
};
