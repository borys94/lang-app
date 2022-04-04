const path = require('path');

module.exports = {
  webpack: {
    alias: {
      "$services": path.resolve(__dirname, 'src/services/'),
      "$components": path.resolve(__dirname, 'src/components/'),
      "$stores": path.resolve(__dirname, 'src/stores/'),
      "$hooks": path.resolve(__dirname, 'src/hooks/'),
      "$routes": path.resolve(__dirname, 'src/routes/'),
      "$types": path.resolve(__dirname, 'src/types/'),
    }
  }
};
