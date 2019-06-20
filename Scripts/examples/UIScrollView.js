const SweetieKit = require('std:sweetiekit.node');
const colors = require('./colors');

const {
  UIScrollView,
  UIView,
  UILabel,
} = SweetieKit;

async function make(nav, demoVC) {
  const scrollView = new UIScrollView();
  const contentView = UIView();

  scrollView.translatesAutoresizingMaskIntoConstraints = false;
  contentView.translatesAutoresizingMaskIntoConstraints = false;

  demoVC.view.addSubview(scrollView);
  scrollView.addSubview(contentView);

  scrollView.leadingAnchor.constraintEqualToAnchor(demoVC.view.leadingAnchor, 20).isActive = true;
  scrollView.trailingAnchor.constraintEqualToAnchor(demoVC.view.trailingAnchor, -20).isActive = true;
  scrollView.topAnchor.constraintEqualToAnchor(demoVC.view.topAnchor, 80).isActive = true;
  scrollView.bottomAnchor.constraintEqualToAnchor(demoVC.view.bottomAnchor, -20).isActive = true;

  contentView.centerXAnchor.constraintEqualToAnchor(scrollView.centerXAnchor, 0).isActive = true;
  contentView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor, 0).isActive = true;
  contentView.topAnchor.constraintEqualToAnchor(scrollView.topAnchor, 0).isActive = true;
  contentView.bottomAnchor.constraintEqualToAnchor(scrollView.bottomAnchor, 0).isActive = true;

  const label1 = UILabel();
  label1.numberOfLines = 0;
  label1.text = 'Lorem ipsum dolor amet aliqua sunt lumbersexual cardigan. Authentic live-edge chia everyday carry, selfies id est. Coloring book activated charcoal dreamcatcher flannel direct trade wayfarers put a bird on it retro locavore health goth seitan enamel pin esse. Excepteur non irony, kitsch nulla pok pok raw denim plaid. Messenger bag deep v ut, photo booth raclette crucifix XOXO glossier veniam ugh labore. Tumblr celiac irure labore, beard live-edge street art health goth non marfa gochujang poke la croix plaid. Duis roof party poutine, copper mug normcore pickled microdosing swag messenger bag. Meggings nulla man braid 8-bit distillery, authentic affogato poke poutine selvage proident actually ullamco sartorial blog. Tattooed letterpress street art four loko. Photo booth hexagon mlkshk, cupidatat officia pinterest distillery. Portland hashtag labore dolore deserunt gochujang, tacos taxidermy ut selfies.';
  label1.textColor = colors.getTheme().textColor;
  label1.sizeToFit();
  label1.translatesAutoresizingMaskIntoConstraints = false;

  const label2 = UILabel();
  label2.numberOfLines = 0;
  label2.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
  label2.textColor = colors.getTheme().textColor;
  label2.sizeToFit();
  label2.translatesAutoresizingMaskIntoConstraints = false;

  const label3 = UILabel();
  label3.numberOfLines = 0;
  label3.text = 'Pop-up brooklyn kitsch distillery. Celiac austin minim live-edge distillery. Ut succulents deserunt, reprehenderit nisi locavore in beard bicycle rights voluptate venmo. Viral quis hammock, mlkshk microdosing aute truffaut lomo. Echo park sed activated charcoal iPhone sriracha irony shoreditch gastropub dreamcatcher disrupt butcher VHS man braid neutra DIY. Chillwave actually sartorial trust fund DIY irony copper mug. Ea enamel pin irure est. Williamsburg adipisicing neutra, cupidatat mollit tofu bitters forage. Messenger bag crucifix commodo jean shorts viral meditation.';
  label3.textColor = colors.getTheme().textColor;
  label3.sizeToFit();
  label3.translatesAutoresizingMaskIntoConstraints = false;

  contentView.addSubview(label1);
  contentView.addSubview(label2);
  contentView.addSubview(label3);

  label1.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  label1.topAnchor.constraintEqualToAnchor(contentView.topAnchor, 0).isActive = true;
  label1.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;

  label2.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  label2.topAnchor.constraintEqualToAnchor(label1.bottomAnchor, 25).isActive = true;
  label2.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;

  label3.centerXAnchor.constraintEqualToAnchor(contentView.centerXAnchor, 0).isActive = true;
  label3.topAnchor.constraintEqualToAnchor(label2.bottomAnchor, 25).isActive = true;
  label3.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, 0).isActive = true;
  label3.widthAnchor.constraintEqualToAnchor(contentView.widthAnchor, -20).isActive = true;

  return undefined;
}

module.exports = make;
