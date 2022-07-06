import { terser } from "rollup-plugin-terser";
/* TODO: Use html-minifier-terser instead */
import { minify } from "html-minifier";
import run from '@rollup/plugin-run';
import strip from '@rollup/plugin-strip';
import replace from "@rollup/plugin-replace";
import CleanCSS from "clean-css";
import fileSystem from "fs";
import typescript from "@rollup/plugin-typescript";
import nodeResolve from "@rollup/plugin-node-resolve";
// import babel from "@rollup/plugin-babel";

export default {
  input: "src/main.js",
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
    /* Could instead use rollup-plugin-html but produced low-quality code */
    replace({
      "ICON_TEMPLATE": readHTML("src/icon.html"),
      "STYLES_TEMPLATE": readCSS("src/styles.css")
    }),
    /* Remove console and assert statements */
    strip(),
    run()
  ],
  onwarn: (warning, next) => {
    if (warning.code === "THIS_IS_UNDEFINED") return;
    next(warning);
  },
  output: [
    // CommonJS，适用于 Node 和 Browserify/Webpack
    // amd 异步模块定义，用于像RequireJS这样的模块加载器
    // iife 一个自动执行的功能，适合作为<script>标签。（如果要为应用程序创建一个捆绑包，您可能想要使用它，因为它会使文件大小变小。）
    // umd 通用模块定义，以amd，cjs 和 iife 为一体
    // esm 将软件包保存为 ES 模块文件，在现代浏览器中可以通过 <script type=module> 标签引入
    {
      file: "dist/bundles.js",
      /* amd, cjs, es, iife, umd, system */
      format: "cjs",
      strict: true
    },
    {
      file: "dist/bundles.min.js",
      format: "iife",
      validate: true,
      /*
        * "hidden" works like true except that the corresponding
        * sourcemap comments in the bundled files are suppressed.
        */
      sourcemap: true,
      /*
        * The global variable name representing your bundle.
        * Other scripts on the same page can use this
        * variable name to access the exports of our bundle.
        */
      name: "themeSwitch",
      plugins: [terser()]
    }
  ],
};

function readHTML(file) {
  const raw = fileSystem.readFileSync(file, { encoding: "utf-8" });
  return minify(raw, {
      removeComments: true,
      collapseWhitespace: true,
      conservativeCollapse: true,
      collapseBooleanAttributes: true
  });
}

function readCSS(file) {
  const raw = fileSystem.readFileSync(file, { encoding: "utf-8" });
  return new CleanCSS().minify(raw).styles;
}
