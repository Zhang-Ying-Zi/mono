module.exports = {
  options: {
    "skip-install": {
      desc: "跳过下载node_modules",
      type: Boolean,
      required: false,
    },
  },
  prompts: [
    {
      type: "list",
      name: "fileType",
      message: "file type :",
      choices: [
        {
          name: "html",
          value: "html",
          checked: true,
        },
        {
          name: "svg",
          value: "svg",
          checked: false,
        },
        {
          name: "canvas",
          value: "canvas",
          checked: false,
        },
        {
          name: "webcomponent",
          value: "webcomponent",
          checked: false,
        },
        {
          name: "vue sfc",
          value: "vue_sfc",
          checked: false,
        },
        {
          name: "vue cdn",
          value: "vue_cdn",
          checked: false,
        },
        {
          name: "vue plugin",
          value: "vue_plugin",
          checked: false,
        },
        {
          name: "vue customElement",
          value: "vue_customElement",
          checked: false,
        },
      ],
    },
    {
      type: "input",
      name: "fileName",
      message: "file name :",
    },
  ],
  filesToCopy: [],
  filesToRender: [
    // {
    //   input: "svg.tpl",
    //   output: "svg.svg",
    // },
  ],
  filesToMerge: [],
  dirsToCreate: [],
};
