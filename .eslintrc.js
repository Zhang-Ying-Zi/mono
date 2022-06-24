module.exports = {
  root: true,
  // This tells ESLint to load the config from the package `eslint-config-zyzgroup`
  extends: ["zyzgroup"],
  settings: {
    next: {
      rootDir: ["apps/*/"],
    },
  },
};
