function cookieParserMiddleware(req, res, next) {
  if (req.cookies) {
    return next();
  }
  const cookieHeader = req.headers.cookie;
  req.cookies = {};
  if (cookieHeader) {
    cookieHeader.split(';').forEach(cookie => {
      const parts = cookie.split('=');
      if (parts.length >= 2) {
        req.cookies[parts[0].trim()] = decodeURIComponent(parts.slice(1).join('='));
      }
    });
  }
  next();
}
module.exports = { cookieParserMiddleware };
