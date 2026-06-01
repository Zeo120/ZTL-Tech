const EventEmitter = require('events');

class TbaisEventEmitter extends EventEmitter {}
const tbaisEvents = new TbaisEventEmitter();

module.exports = { tbaisEvents };
