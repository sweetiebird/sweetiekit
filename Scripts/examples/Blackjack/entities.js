const Suite = {
  diamond: '♦︎',
  club: '♣︎',
  heart: '♥︎',
  spade: '♠︎',
};

const suites = ['Hearts', 'Spades', 'Clubs', 'Diamonds'];
const values = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'];
const points = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10];

class Card {
  constructor(value, suite, points) {
    this.value = value;
    this.suite = suite;
    this.points = points;
  }
}

class Deck {
  constructor() {
    this.cards = [];
    for (let suite in suites) {
      let idx = 0;
      for (let value in values) {
        const card = new Card(values[value], suites[suite], points[idx]);
        this.cards.push(card);
        idx++;
      }
    }
  }

  shuffle() {
    const { cards } = this;
    let m = cards.length, i;

    while (m) {
      i = Math.floor(Math.random() * m--);
      [cards[m], cards[i]] = [cards[i], cards[m]];
    }

    return this;
  }
}

class Player {
  constructor(name, order, money = 0, isDealer = false) {
    this.name = name;
    this.hand = [];
    this.money = money;
    this.isDealer = isDealer;
    this.isStayed = false;
    this.isBust = false;
    this.roundTotal = 0;
    this.currentBet = 0;
    this.blackjack = false;
    this.order = order;
    this.playing = true;
  }

  resetForRound() {
    this.isStayed = false;
    this.isBust = false;
    this.roundTotal = 0;
    this.currentBet = 0;
    this.hand = [];
    this.blackjack = false;
    if (this.money <= 0 && !this.isDealer) {
      this.playing = false;
    }
  }

  bet(amount) {
    if (amount > this.money) {
      this.currentBet = Number(this.money);
    } else {
      this.currentBet = amount;
    }
  }

  deal(card) {
    this.hand.push(card);
  }

  payout(multiplier) {
    this.money += this.currentBet * multiplier;
  }

  get hardTotal() {
    return this.hand.reduce((sum, card) => sum + card.points, 0);
  }

  get softTotal() {
    return this.hand.reduce((sum, card) => {
      if (card.points === 1) {
        return sum + 11;
      }
      return sum + card.points
    }, 0);
  }
}

class Game {
  constructor(players) {
    this.dealer = new Player('Dealer', players.length, 0, true);
    this.players = players;
    this.players.push(this.dealer);

    this.deck = new Deck().shuffle();

    this.activePlayerIdx = 0;
    this.roundOver = false;
    this.paidOut = false;
  }

  start() {
    this.deal();
    this.startTurn();
  }

  bet(player, amount) {
    player.bet(amount);
  }

  reset() {
    this.players.forEach(p => p.resetForRound());

    this.deck = new Deck().shuffle();

    this.activePlayerIdx = 0;
    this.paidOut = false;
    this.roundOver = false;
  }

  restart() {
    this.start();
  }

  deal() {
    for (let i = 0; i < 2; i++) {
      this.players.forEach((p) => {
        if (p.playing) {
          const card = this.deck.cards.pop();
          p.deal(card);
        }
      });
    }
  }

  hit(player) {
    const card = this.deck.cards.pop();

    player.deal(card);

    if (player.hardTotal > 21 && player.softTotal > 21) {
      player.isBust = true;

      if (player.isDealer) {
        this.roundOver = true;
        this.countEmUp();
      } else {
        this.endTurn();
      }
    }
  }

  dealerTurn() {
    const dealer = this.players.filter(p => p.isDealer)[0];

    dealer.blackjack = this.checkForBlackjack(dealer.hand);

    if (!dealer.isBust && !dealer.blackjack && dealer.softTotal <= 16) {
      this.takeTurn(true);
      return;
    }

    dealer.isStayed = true;
    this.roundOver = true;

    for (let p of this.players) {
      console.log('result', p.name, p.softTotal, p.hardTotal, p.currentBet);
    }

    this.countEmUp();
  }

  startTurn() {
    if (!this.roundOver) {
      const player = this.players.filter(p => p.order === this.activePlayerIdx)[0];

      for (let c of player.hand) {
        console.log('Card: ', c.suite, c.value);
      }

      if (player.isDealer) {
        this.dealerTurn();
      } else if (!player.playing) {
        this.endTurn();
      } else if (player.hand.length === 2) {
        const bj = this.checkForBlackjack(player.hand);

        if (bj) {
          player.blackjack = true;
          this.endTurn();
        }
      }
    }
  }

  checkForBlackjack(cards) {
    let hasTen = false;
    let hasAce = false;

    for (let i = 0, len = 2; i < len; i++) {
      const c = cards[i];
      if (c.points === 1) {
        hasAce = true;
      } else if (c.points === 10) {
        hasTen = true;
      }
    }

    return Boolean(cards.length === 2 && hasTen && hasAce);
  }

  takeTurn(isHit = false) {
    if (!this.roundOver) {
      const player = this.players.filter(p => p.order === this.activePlayerIdx)[0];

      if (isHit) {
        this.hit(player);

        if (player.isDealer) {
          this.dealerTurn();
        }
      } else {
        player.isStayed = true;
        this.endTurn();
      }
    }
  }

  endTurn() {
    if (!this.roundOver) {
      this.activePlayerIdx = (this.activePlayerIdx + 1) % this.players.length;
      const player = this.players.filter(p => p.order === this.activePlayerIdx)[0];

      if (player) {
        if (player.isBust) {
          this.endTurn();
          return;
        }

        this.startTurn();
      }
    }
  }

  countEmUp() {
    for (let i = 0, len = this.players.length; i < len; i++) {
      const p = this.players[i];

      let val = 0;

      if (p.softTotal > 21) {
        val = p.hardTotal;
      } else {
        val = Math.max(p.hardTotal, p.softTotal);
      }

      p.roundTotal = val;
    }
    this.calculatePayouts();
  }

  calculatePayouts() {
    if (!this.paidOut) {
      const nonDealers = this.players.filter(p => !p.isDealer);
      const { dealer } = this;

      dealer.roundTotal = dealer.softTotal > 21
        ? dealer.hardTotal
        : Math.max(dealer.softTotal, dealer.hardTotal);

      nonDealers.forEach((p) => {
        let multiplier = 1;

        if (p.blackjack) {
          multiplier = 2;
        } else if (dealer.blackjack || p.roundTotal > 21) {
          multiplier = -1;
        } else if (dealer.roundTotal > 21 || p.roundTotal > dealer.roundTotal) {
          multiplier = 1.5;
        } else if (p.roundTotal < dealer.roundTotal) {
          multiplier = -1;
        }

        p.payout(multiplier);
      });

      this.paidOut = true;

      console.log('ROUND OVER, RESET AND PLACE BETS');
    }
  }
}

let me = new Player('Emily', 0, 10);
let g = new Game([me]);
me.bet(2);
g.start();
