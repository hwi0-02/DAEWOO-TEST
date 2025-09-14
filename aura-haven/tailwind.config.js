/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        'mint-green': '#8DD3BB',
        'blackish-green': '#121211',
        'egoda-gray': '#FAFBFC',
        'form-gray': '#79747E',
        'footer-gray': '#DBDCDA',
      },
      fontFamily: {
        'montserrat': ['Montserrat', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', 'sans-serif'],
      },
      boxShadow: {
        'egoda': '0 4px 16px 0 rgba(17, 34, 17, 0.05)',
      },
    },
  },
  plugins: [],
}
