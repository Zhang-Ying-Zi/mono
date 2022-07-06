import typescript from "@rollup/plugin-typescript";
import nodeResolve from "@rollup/plugin-node-resolve";
// import babel from "@rollup/plugin-babel";

import { terser } from "rollup-plugin-terser";

export default [
  {
    input: "./src/index.ts",
    external: [/@babel\/runtime/],
    plugins: [
      nodeResolve({
        browser: true,
      }),
      typescript({
        tsconfig: "./tsconfig.json",
      }),
      // babel({
      //   exclude: "node_modules/**",
      //   rootMode: "upward",
      //   babelHelpers: "runtime",
      // }),
      terser(),
    ],
    onwarn: (warning, next) => {
      if (warning.code === "THIS_IS_UNDEFINED") return;
      next(warning);
    },
    output: [
      // CommonJS，适用于 Node 和 Browserify/Webpack
      {
        file: "./dist/bundles.cjs.js",
        format: "cjs",
        sourcemap: true,
      },
      // amd 异步模块定义，用于像RequireJS这样的模块加载器
      {
        file: "./dist/bundles.amd.js",
        format: "amd",
        sourcemap: true,
      },
      // iife 一个自动执行的功能，适合作为<script>标签。（如果要为应用程序创建一个捆绑包，您可能想要使用它，因为它会使文件大小变小。）
      {
        file: "./dist/bundles.iife.js",
        format: "iife",
        name: "wcs",
        sourcemap: true,
      },
      // umd 通用模块定义，以amd，cjs 和 iife 为一体
      {
        file: "./dist/bundles.umd.js",
        format: "umd",
        name: "wcs",
        sourcemap: true,
      },
      // esm 将软件包保存为 ES 模块文件，在现代浏览器中可以通过 <script type=module> 标签引入
      {
        file: "./dist/bundles.esm.js",
        format: "esm",
        sourcemap: true,
      },
    ],
  },
];
