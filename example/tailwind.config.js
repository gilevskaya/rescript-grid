const colors = require("tailwindcss/colors");

module.exports = {
  theme: {
    extend: {
      colors: {
        primary: colors.blue[800],
      },
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/forms")],
  purge: {
    content: ["./src/**/*.html", "./src/**/*.re", "./src/**/*.bs.js"],
  },
};
