const SweetieRenderer = {
  render(element, app, callback) {
    console.log(element, app);
    app.keyWindow.setRootViewController(element);
  },
};

module.exports = SweetieRenderer;
