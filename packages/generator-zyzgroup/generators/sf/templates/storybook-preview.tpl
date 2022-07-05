// .storybook/preview.js

import { PrismLight as SyntaxHighlighter } from "react-syntax-highlighter";
import scss from "react-syntax-highlighter/dist/esm/languages/prism/scss";

// Registers and enables scss language support
SyntaxHighlighter.registerLanguage("scss", scss);

export const parameters = {
  actions: { argTypesRegex: "^on[A-Z].*" },
  controls: {
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
    expanded: false,
    // presetColors: [
    //   { color: "#ff4785", title: "Coral" },
    //   "rgba(0, 159, 183, 1)",
    //   "#fe4a49",
    // ],
  },
};

// export const decorators = [
//   (story) => `<div style="margin: 4rem 0 0 4rem;">${story()}</div>`,
// ];

// export const globalTypes = {
//   theme: {
//     name: "Theme",
//     description: "Global theme for components",
//     defaultValue: "light",
//     toolbar: {
//       icon: "circlehollow",
//       // Array of plain string values or MenuItem shape (see below)
//       items: ["light", "dark"],
//       // Property that specifies if the name of the item will be displayed
//       showName: true,
//       // Change title based on selected value
//       dynamicTitle: true,
//     },
//   },
// };

//////////// consume new theme global in a decorator using the context.globals.theme value
// import { ThemeProvider } from "styled-components";
// import { MyThemes } from "../my-theme-folder/my-theme-file";
// // Function to obtain the intended theme
// const getTheme = (themeName) => {
//   return MyThemes[themeName];
// };
// const withThemeProvider = (Story, context) => {
//   const theme = getTheme(context.globals.theme);
//   return (
//     <ThemeProvider theme={theme}>
//       <Story {...context} />
//     </ThemeProvider>
//   );
// };
// export const decorators = [withThemeProvider];
