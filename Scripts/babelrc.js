module.exports = function (api) {
  api.cache(false);

  const presets = [
    ["@babel/preset-env",
      {
        modules: false,
        targets: {
          node: "current"
        },
        exclude: ['babel-plugin-transform-classes']
      }], "@babel/preset-react"
  ];

  return {
    presets,
  };
};
