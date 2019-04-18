express = require('express');
bodyParser = require('body-parser');
uuid = require('uuid4');

Blockchain = require('./blockchain');

const blockChain = new Blockchain();
const nodeId = uuid().toString().replace('-', '');
const app = express();

const args = process.argv;
const port = 5000;

const mine = () => {
  const lastBlock = blockChain.lastBlock;
  const lastProof = lastBlock.proof;
  const proof = Blockchain.proofOfWork(lastProof);

  blockChain.newDataTransaction(0, nodeId, 1);

  const previousHash = Blockchain.hash(lastBlock);
  const block = blockChain.newBlock(proof, previousHash);

  const response = {
    message: 'New block forged',
    index: block.index,
    data: block.data,
    proof: block.proof,
    previousHash: block.previousHash,
  };

  return response;
}

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true,
}));

app.get('/mine', (req, res) => {
  return res.status(200).json(mine());
});

app.get('/mine10', (req, res) => {
  let mined = [];
  for (let i = 0; i < 10; i++) {
    mined = (mine())
  }
  return res.status(200).json(mined);
});

app.get('/mine100', (req, res) => {
  let mined = [];
  for (let i = 0; i < 100; i++) {
    mined = (mine())
  }
  return res.status(200).json(mined);
});

app.get('/mine1000', (req, res) => {
  let mined = [];
  for (let i = 0; i < 1000; i++) {
    mined = (mine())
  }
  return res.status(200).json(mined);
});

app.get('/mine10000', (req, res) => {
  let mined = [];
  for (let i = 0; i < 10000; i++) {
    mined = (mine())
  }
  return res.status(200).json(mined);
});

app.post('/transactions', (req, res) => {
  const { sender, recipient, data } = req.body;

  if (!sender || !recipient || !data) {
    return res.sendStatus(400);
  }

  const index = blockChain.newDataTransaction(sender, recipient, data);
  const response = { message: `Data transaction added to block ${index}` };

  return res.status(200).json(response);
});

app.get('/chain', (req, res) => {
  const response = {
    chain: blockChain.chain,
    length: blockChain.chain.length,
  };

  return res.status(200).json(response);
});

app.post('/nodes/register', (req, res) => {
  const { nodes } = req.body;

  if (!nodes) return res.sendStatus(400);

  const nodeArray = JSON.parse(nodes);
  nodeArray.forEach(node => blockChain.registerNode(node));

  const response = {
    message: 'New nodes added',
    totalNodes: blockChain.nodes.entries(),
  };

  return res.status(200).json(response);
});

app.get('/nodes/resolve', async (req, res) => {
  const response = { message: '', newChain: blockChain.chain };
  const replaced = await blockChain.resolveConflicts();
  if (replaced) {
    response.message = 'Chain replaced';
  } else {
    response.message = 'Chain is authoritative';
  }
  return res.status(200).json(response);
});

app.get('/', (req, res) => {
  return res.status(200).render("askdjfkljds");
});

app.listen(port, () => console.log(`Listening on port ${port}`));
