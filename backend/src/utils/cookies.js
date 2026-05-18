const { env } = require('../config/env');

function sessionCookieOptions() {
  return {
    httpOnly: true,
    secure: env.isProduction,
    sameSite: 'strict',
    path: '/',
    maxAge: env.sessionTtlSeconds * 1000
  };
}

function csrfCookieOptions() {
  return {
    httpOnly: false,
    secure: env.isProduction,
    sameSite: 'strict',
    path: '/',
    maxAge: env.sessionTtlSeconds * 1000
  };
}

module.exports = {
  sessionCookieOptions,
  csrfCookieOptions
};
