const { httpError } = require('./httpError');

function requireObject(value, name = 'body') {
  if (!value || typeof value !== 'object' || Array.isArray(value)) {
    throw httpError(400, `Valid ${name} is required`);
  }
  return value;
}

function normalizeEmail(value) {
  return String(value || '').trim().toLowerCase();
}

function validateEmail(value) {
  const email = normalizeEmail(value);
  if (!email || email.length > 254 || !email.includes('@')) {
    throw httpError(400, 'Valid email is required');
  }
  return email;
}

function validatePassword(value) {
  const password = String(value || '');
  if (!password || password.length > 1024) {
    throw httpError(400, 'Password is required');
  }
  return password;
}

function validateIntegerId(value, name) {
  const id = Number(value);
  if (!Number.isInteger(id) || id <= 0) {
    throw httpError(400, `Valid ${name} is required`);
  }
  return id;
}

function validateLoginBody(body) {
  const object = requireObject(body);
  return {
    email: validateEmail(object.email),
    password: validatePassword(object.password)
  };
}

module.exports = {
  requireObject,
  normalizeEmail,
  validateEmail,
  validatePassword,
  validateIntegerId,
  validateLoginBody
};
