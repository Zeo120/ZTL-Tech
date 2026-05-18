const { fail } = require('../utils/responses');

function notFound(req, res) {
  return fail(res, 404, 'Route not found');
}

module.exports = { notFound };
