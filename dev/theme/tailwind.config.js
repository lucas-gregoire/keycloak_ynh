const colors = require('tailwindcss/colors');

/**
 * @type { import('@types/tailwindcss/tailwind-config').TailwindConfig }
 */
module.exports = {
  content: ['./theme/**/*.ftl'],
  plugins: [require('@tailwindcss/forms')],
  theme: {
    extend: {
      colors: {
        primary: {
          100: '#79a4a5',
          200: '#79a4a5',
          300: '#79a4a5',
          400: '#79a4a5',
          500: '#79a4a5',
          600: '#286566',
          700: '#286566',
          800: '#286566',
          900: '#286566'
        },
      },
    },
  },
};
